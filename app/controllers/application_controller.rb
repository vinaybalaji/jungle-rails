class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end

  def rating_options
    @rating_options = [1, 2, 3, 4, 5]
  end
  helper_method :rating_options

  def admin_user
    authenticate_or_request_with_http_basic do |name, password|
      if name == ENV['ADMIN_USER_NAME'] && password == ENV['ADMIN_PASSWORD']
        return true
      else 
        return false
      end
    end
  end
  helper_method :admin_user

end
