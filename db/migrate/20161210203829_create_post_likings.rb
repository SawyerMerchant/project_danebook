class CreatePostLikings < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, foreign_key: true
      t.integer :post_id, foreign_key: true


      t.timestamps
    end
    add_index :likes, [:user_id, :post_id], unique: true
  end
end
