class AddUserIdToZoos < ActiveRecord::Migration
  def change
    add_column :zoos, :user_id, :integer, null: false
  end
end
