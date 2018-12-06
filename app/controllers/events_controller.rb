class EventsController < ApplicationController
    @places = Place

    def top
        @events = Event.order("created_at").limit(5)
        @asideTitle = "最新の5件"
    end

    def search
        @events = Event.search(params[:q])
        @asideTitle = params[:q]+"の検索結果"
        render "top"
    end
end
