class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def account
    if( session[:user_id] )
      User.find_by( id: session[:user_id] )
    end
  end

  helper_method( :account )
end
