class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :topic_id
      t.integer :rating
      t.string :comments
      t.timestamps
    end
  end
end