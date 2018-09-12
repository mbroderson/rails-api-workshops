class UsersController < ApplicationController
  def create
    user = User.create!(name: params[:name])
    render json: user, status: 200
  rescue ActiveRecord::RecordInvalid
    render status: 422
  end
end
