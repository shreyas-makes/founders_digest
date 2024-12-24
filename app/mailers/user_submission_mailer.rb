class UserSubmissionMailer < ApplicationMailer
    def reject(email)

        mail(to: email, subject: "Sorry, you're rejected")
    end

    def accept(email)
    
        mail(to: email, subject: "Congrats, you're accepted")

    end


end