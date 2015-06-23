Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "d023399a54703e8768b8", "cbd8ec220e5e47982f4140bad139f3583731e368"
end
