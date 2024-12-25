module Onboardable
  extend ActiveSupport::Concern

  included do
    # after_create :send_welcome_email
  end

  def finished_onboarding?
    stripe_subscription_id?
  end

  def send_welcome_email
    Rails.logger.info "Attempting to send welcome email to #{email}"  # Add logging
    result = UserMailer.welcome(self).deliver
    Rails.logger.info "Welcome email delivery result: #{result.inspect}"  # Add logging
  end
  # handle_asynchronously :send_welcome_email
end
