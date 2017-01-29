# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings =
  {

    :address            => 'smtp.sendgrid.com',
    :port               => 25,
    :domain             => 'heroku.com',
    :authentication     => :plain,
    :user_name          => 'pugetsoundkarateleague@gmail.com',
    :password           => 'mutantk1ll3r'
    :enable_startstls_auto => true
  }
