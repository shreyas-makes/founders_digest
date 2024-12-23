class Admin::PagesController < ApplicationController
    before_action :authenticate_user!, only: [:logout]
  
    def dashboard
        @user_submissions = UserSubmission.all
    end

    def logout
        sign_out(current_user)
        redirect_to root_path
    end

  end
  