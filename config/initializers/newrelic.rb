NewRelic::Agent.after_fork(:force_reconnect => true) if Rails.env.production?

