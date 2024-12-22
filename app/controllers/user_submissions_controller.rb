class UserSubmissionsController < ApplicationController
    def create
        puts "WHITELISTED PARAMS: #{user_submission_params}"
        UserSubmission.create!(user_submission_params)
        redirect_to root_path, notice: 'We just received it, thank you!'
        # puts "PARAMS: #{params}"
        # In here, we will get the client request while submitting the form
    end

# Accepts form inputs from the /apply page, anything else, we will separate concerns using an admin controller
    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :text, :email, :plan, :website, :plan, :job_role)
   end
end