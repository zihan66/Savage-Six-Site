class ChangeMilitaryToBeBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :military, :boolean, :default => false 
  end
end
