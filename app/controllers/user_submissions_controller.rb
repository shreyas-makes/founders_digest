class UserSubmissionsController < ApplicationController
    def create
        puts "URL params: #{params}"
        puts "Submission params: #{user_submission_params}"
  
        @user_submission = UserSubmission.create!(user_submission_params)
        puts "Created submission with plan_name: #{@user_submission.plan_name}"
  
        # puts "WHITELISTED PARAMS: #{user_submission_params}"
        # UserSubmission.create!(user_submission_params)
        redirect_to root_path, notice: 'We just received it, thank you!'
        # TODO: Redirect to thank you page
        # puts "PARAMS: #{params}"
        # In here, we will get the client request while submitting the form
    end

    def update
        # TODO: Update user submissions status
    end

# Accepts form inputs from the /apply page, anything else, we will separate concerns using an admin controller
    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :text, :email, :plan, :website, :plan, :job_role, :plan_name, :status)
   end
end