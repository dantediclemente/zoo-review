class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.boolean :up_vote, null: false, default: false
      t.boolean :down_vote, null: false, default: false
    end
  end
end
