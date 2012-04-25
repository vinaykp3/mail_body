ActionMailer::Base.smtp_settings = {
  #:address              => "smtp.gmail.com",
  #:port                 => 587,
  #:domain               => "vinaykp3@gmail.com",
  #:user_name            => "vinaykp3",
  #:password             => "sahanakpv",
  #:authentication       => "plain",
  #:enable_starttls_auto => true

  :address              => "mail.relyonsoft.com",
  :port                 => 25,
  :domain               => "relyonsoft.com",
  :user_name            => "vinay.kp@relyonsoft.com ",
  :password             => "39709164",
  :authentication       => "login",
  :enable_starttls_auto => false ,
  :content_type => "text/html"
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#config.action_mailer.asset_host = 'http://localhost:3000'
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?