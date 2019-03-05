class UsersController < ApplicationController
    def new
        @user = User.new()
    end

    def index
        if( !account.present? || !account.admin )
            flash.notice = "アクセス権限がありません。"
            redirect_to( :root )
        end
        @users = User.order("created_at")
    end

    def create
        @user = User.new(params[:user])
        if( @user.save )
            session[:user_id] = @user.id
            redirect_to( user_path( @user.id ), notice: "ユーザー登録が完了しました。" )
        else
            render "new"
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.assign_attributes(params[:user])
        if( params[:user][:password] == "" )
            if( params[:user][:password] == "" && params[:user][:password_confirmation] != "" )
                redirect_to( edit_user_path, notice: "パスワードの確認が一致しません。" )
                return
            end
            @user.password = User.find(params[:id]).password
            @user.password_confirmation = User.find(params[:id]).password
        end
        if( @user.save )
            redirect_to( user_path(params[:id]), notice: "ユーザー情報の編集を完了しました。" )
        else
            render("edit")
        end
    end

    def show
        if( !account.present? || account.id.to_s != params[:id] )
            flash.notice = "アクセス権限がありません。"
            redirect_to( :root )
        end
        @user = User.find(params[:id])
        @logs = Log.order("created_at").where( user_id: @user.id )
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy()
        redirect_to( "/", notice: "退会：アカウントを削除しました。" )
    end
end