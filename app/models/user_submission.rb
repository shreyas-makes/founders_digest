class UserSubmission < ApplicationRecord
    validates :first_name, :last_name, :email, :website, :job_role, :text, presence: true
    validates :plan_name, inclusion: { in: %w(free paid) }

    after_update :send_mailer

    def send_mailer
        puts "SENDING MAILER.."
        UserSubmissionMailer.reject(self.email).deliver if status == 'reject'
        UserSubmissionMailer.accept(self.email).deliver if status == 'accept'
    end

end
