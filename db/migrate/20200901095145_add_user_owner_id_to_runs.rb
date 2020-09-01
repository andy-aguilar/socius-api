class AddUserOwnerIdToRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :runs, :user_owner_id, :integer
  end
end
