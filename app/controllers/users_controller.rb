class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    if params[:user][:first_name].blank? || params[:user][:last_name].blank?
      flash[:notice] = "Oops, couldn't create account. Please make sure you enter a first name and last name."
      return
    end
    if params[:user][:email].blank?
      flash[:notice] = "Oops, couldn't create account. Please make sure you are entering a valid email and try again."
      return
    end
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      flash[:notice] = "Oops, couldn't create account. Please make sure you are entering a valid password."
      return
    end
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:notice] = "Oops, passwords don't match. Please try again."
      return
    end
    if User.exists?(email: params[:user][:email])
      flash[:notice] = "Oops, account already exists. Please try again or log in with your existing email."
      return
    end
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end