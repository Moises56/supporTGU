# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings  = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'labitcoinera.com',
    :user_name            => 'labitcoinerasuppor',
    :password             => 'memphis!M.',
    :authentication       => 'plain',
    :enable_starttls_auto => true  
}

