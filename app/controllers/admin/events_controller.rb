class Admin::EventsController < Admin::Base
    def index
        @events = Event.order("created_at")
    end

    def show
        cookies[:recentview] = params[:id]
        @e = Event.find(params[:id])
        @tickets = Ticket.where(event_id: params[:id])
    end
end