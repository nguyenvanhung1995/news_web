class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :header
      t.text :content
      t.text :content_new
      t.string :video
      t.boolean :active
      t.boolean :public

      t.timestamps
    end
  end
end
