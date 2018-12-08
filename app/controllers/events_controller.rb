class EventsController < ApplicationController
    def top
        @events = Event.order("created_at").limit(5)
        @asideTitle = "トップページ - 最新の5件"
    end

    def search
        cookies[:recentsearch] = params[:q]
        @events = Event.search(params[:q], params[:term])
        if( !params[:term] || params[:term].length == 0 )
            @asideTitle = "「"+params[:q]+"」の検索結果("+@events.count.to_s+"件)"
        else
            @asideTitle = "「"+params[:q]+"」("+params[:term]+")の検索結果("+@events.count.to_s+"件)"
        end
        if( params[:q].length == 0 )
            render("index") 
            return
        end
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