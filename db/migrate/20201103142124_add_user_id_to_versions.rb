class AddUserIdToVersions < ActiveRecord::Migration[6.0]
  def change
    add_column :Versions, :user_id, :integer
  end
end
