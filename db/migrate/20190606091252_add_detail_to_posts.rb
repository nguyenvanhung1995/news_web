class AddDetailToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :category_id, :integer
    change_column_default :posts, :active, false
    change_column_default :posts, :public, false
  end
end
