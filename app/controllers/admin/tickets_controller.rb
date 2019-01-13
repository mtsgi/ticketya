class Admin::TicketsController < Admin::Base
    def new
        @t = Ticket.new( event_id: params[:id] )
        @e = Event.find( params[:event_id] )
    end
    

    def create
        @ticket = Ticket.new( params[:ticket] )
        if( @ticket.save )
            redirect_to( admin_event_path(@ticket.event_id), notice: "チケットを追加しました" )
        else
            redirect_to( admin_event_path(@ticket.event_id), notice: "チケットの入力内容が不正です。もう一度試してください。" )
        end
    end
end
