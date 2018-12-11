class TicketsController < ApplicationController
    def show
        @ticket = Ticket.find(params[:id])
        @event = Event.find( @ticket.event_id )
    end
end
