class CreateFrindsUser < ActiveRecord::Migration[5.0]
  def change
    create_table :friends_users do |t|
      t.references :user
      t.references :friend, references: :users
    end
  end
end
