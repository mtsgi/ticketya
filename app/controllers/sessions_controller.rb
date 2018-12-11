class SessionsController < ApplicationController
    def create
        user = User.auth( params[:tel], params[:password] )
        if( user )
            session[:user_id] = user.id
            flash.notice = "ログインが完了しました"
        else
            flash.notice = "電話番号またはパスワードが間違っています"
        end
        redirect_to( :root )
    end

    def destroy
        session.delete( :user_id )
        flash.notice = "ログアウトしました"
        redirect_to( :root )
    end
end
