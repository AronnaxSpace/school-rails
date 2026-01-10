# Development defaults - in production use Rails credentials or ENV vars
if Rails.env.development? || Rails.env.test?
  ENV["ADMIN_USERNAME"] ||= "admin"
  ENV["ADMIN_PASSWORD"] ||= "changeme123"
end
