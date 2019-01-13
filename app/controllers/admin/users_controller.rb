class Admin::UsersController < Admin::Base
    def index
        @users = User.order("created_at")
    end
end
