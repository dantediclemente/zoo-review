class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :vote, :integer, null: false, default: 0
  end
end
