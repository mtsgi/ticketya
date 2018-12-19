class UsersController < ApplicationController
    def new
        @user = User.new()
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
            flash.notice = "アクセスできません"
            redirect_to( :root )
        end
        @user = User.find(params[:id])
    end
end