class EventsController < ApplicationController
    def top
        @events = Event.order("created_at").limit(5)
        @asideTitle = "トップページ - 最新の5件"
    end

    def search
        cookies[:recentsearch] = params[:q]
        @events = Event.search(params[:q], params[:term], params[:date], params[:area])


        termQuery = ""
        termQuery = "「"+params[:q]+"」" if( params[:q].length!=0 )

        termName = ""
        termName = params[:term] if( params[:term] )
        if( params[:term]=="name" )
            termName = "公演名"
        elsif( params[:term]=="artist" )
            termName = "アーティスト"
        elsif( params[:term]=="hall" )
            termName = "会場"
        end

        termDate = ""
        termDate = "("+params[:date]+")" if( params[:date].present? )

        @asideTitle = "検索結果:"+termName+termQuery+termDate
        @searchNum = @events.count.to_s

        render("top")
    end

    def index
        @events = Event.order("created_at")
    end

    def show
        cookies[:recentview] = params[:id]
        @e = Event.find(params[:id])
        @tickets = Ticket.where(event_id: params[:id])
    end
end