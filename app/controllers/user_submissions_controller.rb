class UserSubmissionsController < ApplicationController
    def create
        # UserSubmission.create!(user_submission_params)
        # redirect_to root_path
        puts "WHITELISTED PARAMS: #{user_submission_params}"
        # puts "PARAMS: #{params}"
        # In here, we will get the client request while submitting the form
    end


    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :text, :email, :plan, :website, :plan, :job_role)
   end
end