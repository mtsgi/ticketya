class Admin::UsersController < Admin::Base
    def index
        @users = User.order("created_at")
    end

    def show
        @user = User.find(params[:id])
        @logs = Log.order("created_at").where( user_id: @user.id )
    end
end
