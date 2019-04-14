class ChangeClassyearToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :classyear, :integer
  end
end
