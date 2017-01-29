# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings =
  {

    :address            => 'smtp.sendgrid.net',
    :port               => 587,
    :domain             => 'heroku.com',
    :authentication     => :plain,
    :user_name          => 'pugetsoundkarateleague@gmail.com',
    :password           => 'mutantk1ll3r',
    :enable_startstls_auto => true
  }
