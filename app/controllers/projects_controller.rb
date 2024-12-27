class ProjectsController < ApplicationController
    def create
        Project.create!(project_submission_params)
        redirect_to dashboard_path
    end

    private

# Accepts form inputs from the /apply page, anything else, we will separate concerns using an admin controller
    def project_submission_params
        params.require(:project_submission).permit(:title, :description)
    end
end