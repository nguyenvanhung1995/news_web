class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.integer :action
      t.integer :user_id
      t.string :reactionable_type
      t.integer :reactionable_id

      t.timestamps
    end
  end
end
