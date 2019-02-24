class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastname, :string
    add_column :users, :major, :string
    add_column :users, :classyear, :string
    add_column :users, :occupation, :string
    add_column :users, :phonenumber, :integer
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
  end
end
