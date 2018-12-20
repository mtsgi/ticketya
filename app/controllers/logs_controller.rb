class LogsController < ApplicationController
    def new
        if( params[:ticket_id].present? )
            @ticket = Ticket.find(params[:ticket_id])
            @event = Event.find( @ticket.event_id )
            @logs = Log.where( ticket_id: @ticket.id )
        end

        @log = Log.new()
    end

    def create
        params[:log][:user_id] = account.id
        @log = Log.new(params[:log])
        if( @log.save )
            redirect_to( user_path(account), notice: "購入処理を完了しました。詳細はマイページからご確認ください。" )
        else
            render "new"
        end
    end
end
