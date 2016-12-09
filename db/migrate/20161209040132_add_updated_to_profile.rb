class AddUpdatedToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :updated, :boolean, default: false
  end
end
