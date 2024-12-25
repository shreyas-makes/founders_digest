class UserSubmissionMailer < ApplicationMailer
    def reject(user_submission)
        @name = user_submission.first_name
        mail(to: user_submission.email, subject: "Sorry, you're rejected")
    end

    def accept(user_submission)
        @name = user_submission.first_name
        mail(to: user_submission.email, subject: "Congrats, you're accepted")
    end

end