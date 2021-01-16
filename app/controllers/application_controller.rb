class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    unless header.nil? || header.blank?
      token = header.split(' ').last
      begin
        Auth.verify(token)
      rescue Exception => e
        render json: { status: 401, error: 'Unauthorized', message: e.message }, status: :unauthorized
      end
    else
      render json: { status: 401, error: 'Unauthorized', message: I18n.t("messages.errors.sem_autorizacao") }, status: :unauthorized
    end
  end
end
