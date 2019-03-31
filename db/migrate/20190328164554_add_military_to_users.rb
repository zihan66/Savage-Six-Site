class AddMilitaryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :military, :integer
  end
end
