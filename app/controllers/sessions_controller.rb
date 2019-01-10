class SessionsController < ApplicationController
    def create
        user = User.auth( params[:tel], params[:password] )
        if( user )
            session[:user_id] = user.id
            flash.notice = "ログインが完了しました"
            if( account.admin? )
                redirect_to( admin_top_index_path, notice: "管理者ログインに成功しました。" )
                return
            end
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
