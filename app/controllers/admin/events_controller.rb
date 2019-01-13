class Admin::EventsController < Admin::Base
    def index
        @events = Event.order("created_at")
    end

    def show
        cookies[:recentview] = params[:id]
        @e = Event.find(params[:id])
        @tickets = Ticket.where(event_id: params[:id])
    end

    def new
        @e = Event.new()
    end

    def create
        @e = Event.new(params[:event])
        if( @e.save )
            redirect_to( "/", notice: "チケットを追加しました。" )
        else
            render "new"
        end
    end

    def edit
        @e = Event.find(params[:id])
        if( @e.available )
            @e.available = false
        else
            @e.available = true
        end
        if( @e.save ) 
            redirect_to( admin_event_path(params[:id]), notice: "利用可否を変更しました。" )
        else
            redirect_to( admin_event_path(params[:id]), notice: "利用可否の変更を試みましたが、データベースに書き込みできませんでした。" )
        end
    end
end