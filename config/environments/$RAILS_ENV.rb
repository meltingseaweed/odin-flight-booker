  config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:         "smtp.gmail.com",
  port:            587,
  domain:          "example.com",
  user_name:       ENV["MAIL_USER"],
  password:        ENV["MAIL_PASS"],
  authentication:  "plain",
  enable_starttls: true,
  open_timeout:    5,
  read_timeout:    5 }
