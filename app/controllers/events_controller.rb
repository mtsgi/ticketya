class EventsController < ApplicationController
    def top
        @events = Event.order("created_at").limit(5)
        @asideTitle = "トップページ - 最新の5件"
    end

    def search
        cookies[:recentsearch] = params[:q]
        @events = Event.search(params[:q])
        @asideTitle = "「"+params[:q]+"」の検索結果("+@events.count.to_s+"件)"
        if( params[:q].length == 0 )
            render("index") 
            return
        end
        render("top")
    end

    def index
        @events = Event.order("created_at")
    end

    def area
        params[:area]
    end

    def show
        cookies[:recentview] = params[:id]
        @e = Event.find(params[:id])
    end
end