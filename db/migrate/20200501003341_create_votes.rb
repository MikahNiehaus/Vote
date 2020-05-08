class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :topic_id
      t.boolean :opinion
      t.string :comment
      t.timestamps
    end
  end
end