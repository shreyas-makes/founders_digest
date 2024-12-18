class ChangeSubscriptionsToSubscribers < ActiveRecord::Migration[8.0]
  def change
    rename_table :subscriptions, :subscribers
  end
end
