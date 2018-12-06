class EventsController < ApplicationController
    def top
        @events = Event.limit(5)
    end
end
