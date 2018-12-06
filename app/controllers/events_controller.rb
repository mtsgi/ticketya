class EventsController < ApplicationController
    def top
        @events = Event.order("created_at").limit(5)
    end

    def search
        @events = Event.search(params[:q])
        render "top"
    end
end
