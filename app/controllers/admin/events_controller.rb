class Admin::EventsController < Admin::Base
    def index
        @events = Event.order("created_at")
    end

    def show
        cookies[:recentview] = params[:id]
        @e = Event.find(params[:id])
        @tickets = Ticket.where(event_id: params[:id])
    end

    def edit
        @e = Event.find(params[:id])
        if( @e.available )
            @e.available = false
        else
            @e.available = true
        end
        @e.save
        redirect_to( admin_event_path(params[:id]), notice: "利用可否を変更しました。" )
    end
end