class AddFirstNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :FirstName, :string
  end
end
