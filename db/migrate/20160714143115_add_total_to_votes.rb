class AddTotalToVotes < ActiveRecord::Migration
  def change
    add_column :reviews, :vote_total, :integer, default: 0
  end
end
