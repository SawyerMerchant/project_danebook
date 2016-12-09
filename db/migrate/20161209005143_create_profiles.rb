class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :birthday
    remove_column :users, :gender

    create_table :profiles do |t|
      t.string :college
      t.string :hometown
      t.string :currentlylives
      t.string :telephone
      t.text :words
      t.text :about
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday
      t.string :gender
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
