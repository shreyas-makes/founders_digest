class UserSubmission < ApplicationRecord
    validates :first_name, :last_name, :email, :website, :job_role, :text, presence: true
    validates :plan_name, inclusion: { in: %w(free paid) }

    after_update :finish_processing

    def finish_processing
        reject! if status == 'reject'
        accept! if status == 'accept'
    end


    def reject!
        UserSubmissionMailer.reject(self).deliver
    end

    def accept!
        UserSubmissionMailer.accept(self).deliver
    end

end
