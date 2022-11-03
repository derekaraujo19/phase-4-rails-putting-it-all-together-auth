class UsersController < ApplicationController

  skip_before_action :authorize, only: :create

  # create an account
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  # Staying logged in
  def show
    user = User.find_by(id: session[:user_id])
    render json: user, status: :created
  end













  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  end

















  # skip_before_action :authorize, only: :create

  # # Sign Up
  # def create
  #   user = User.create!(user_params)
  #   session[:user_id] = user.id
  #   render json: user, status: :created
  # end

  # # Stay Logged In
  # def show
  #   user = User.find_by(id: session[:user_id])
  #   render json: user, status: :created
  # end

  # private

  # def user_params
  #   params.permit(:username, :password, :image_url, :bio, :password_confirmation)
  # end



end