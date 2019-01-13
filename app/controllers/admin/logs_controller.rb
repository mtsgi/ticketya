class Admin::LogsController < Admin::Base
    def index
        @logs = Log.order("created_at")
    end
end
