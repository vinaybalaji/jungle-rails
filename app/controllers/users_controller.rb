class UsersController < ApplicationController
  
  def new
  end

  def create
    new_user = create_user
    if new_user && new_user.valid?
      session[:user_id] = new_user.id
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def create_user
    user = params[:user]
    first_name = user[:first_name]
    last_name = user[:last_name]
    email = user[:email]
    password = user[:password]
    password_confirmation = user[:password_confirmation]
    if first_name.blank? || last_name.blank?
      message = "Oops! Please make sure you enter a first name and last name."
    end
    if email.blank?
      message = "Oops! Please make sure you are entering a valid email and try again."
    end
    if password.blank? || password_confirmation.blank?
      message = "Oops! Please make sure you are entering a valid password."
    end
    if password != password_confirmation
      message = "Oops! Passwords don't match. Please try again."
    end
    if User.exists?(email: email)
      message = "Oops! E-mail already exists. Please try again or log in with your existing email."
    end
    if message
      flash[:notice] = message
      return
    end
    new_user = User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    )
    new_user.save!
    new_user
  end
  
end