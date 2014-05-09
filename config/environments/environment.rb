Depot::Application.configure do |
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "domain.of.sender.net",
    authentication: "plain",
    user_name: "sjpmatson@gmail.com",
    password: "Hobbes13",
    enable_starttls_auto: true
  }
end