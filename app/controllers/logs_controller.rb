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
        
        if( Ticket.find(params[:log][:ticket_id]).total - Log.where( ticket_id: params[:log][:ticket_id] ).sum(:quantity) - params[:log][:quantity].to_i < 0 )
            redirect_to( root_path(), notice: "購入処理が完了できませんでした。" )
            return
        end

        @log = Log.new(params[:log])
        if( @log.save )
            redirect_to( user_path(account), notice: "購入処理を完了しました。詳細はマイページからご確認ください。" )
        else
            render "new"
        end
    end
end
