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
            redirect_to( "/", notice: "ユーザー登録が完了しました" )
        else
            render "new"
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        if( !account.present? || account.id.to_s != params[:id] )
            if( !account.admin )
                flash.notice = "アクセス権限がありません。"
                redirect_to( :root )
            end
        end
        @user = User.find(params[:id])
        @logs = Log.order("created_at")
    end
end