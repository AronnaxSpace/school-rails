module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin
  end

  private

  def authenticate_admin
    authenticate_or_request_with_http_basic("Admin Area") do |username, password|
      username_match = ActiveSupport::SecurityUtils.secure_compare(
        username.to_s,
        ENV["ADMIN_USERNAME"].to_s
      )

      password_match = ActiveSupport::SecurityUtils.secure_compare(
        password.to_s,
        ENV["ADMIN_PASSWORD"].to_s
      )

      username_match && password_match
    end
  end
end
