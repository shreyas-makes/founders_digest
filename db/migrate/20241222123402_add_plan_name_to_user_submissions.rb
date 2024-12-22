class AddPlanNameToUserSubmissions < ActiveRecord::Migration[8.0]
  def change
    add_column :user_submissions, :plan_name, :string
  end
end
