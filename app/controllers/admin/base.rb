class Admin::Base < ApplicationController
    before_action :admin_login_required

    private
    def admin_login_required
        render( text: "このページの表示には管理者権限が必要です。" ) unless account.try(:admin?)
    end
end