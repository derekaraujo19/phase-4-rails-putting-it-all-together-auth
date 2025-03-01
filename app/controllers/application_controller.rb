class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize


  private

  def render_unprocessable_entity_response(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

  def authorize
    render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
  end



end
