class UserSubmission < ApplicationRecord
    validates :first_name, :last_name, :email, :website, :job_role, :text, presence: true
    validates :plan_name, inclusion: { in: %w(free paid) }
end
