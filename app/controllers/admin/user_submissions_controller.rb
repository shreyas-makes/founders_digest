class Admin::UserSubmissionsController < ApplicationController

    before_action :set_user_submission
    

    def update
        if @user_submission.update(user_submission_params)
            redirect_to admin_path, notice: 'User submission updated successfully'
            # Send mailer with accepted or rejected status
        else
        redirect_to admin_path, alert: 'Failed to update user submission'
        end
    end

    private
        # Accepts form inputs from the /apply page, anything else, we will separate concerns using an admin controller  
        def user_submission_params
            params.require(:user_submission).permit(:status)
        end

        def set_user_submission
            @user_submission = UserSubmission.find(params[:id])
        end

    
end