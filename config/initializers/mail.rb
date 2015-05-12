ActionMailer::Base.smtp_settings = {
adddress: "smtp.mandrillapp.com",
port: 587,
enable_starttls_auto: true,
user_name: "duribe8@gmail.com",
password: "YVhnbWhfRPIrCRaBz3FXhQ",
authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"

ActionMailer::Base.default_url_options[:host] = "localhost:3000"