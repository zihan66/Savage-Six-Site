class ChangeClassyearToBeDatetimeInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :classyear, :datetime
  end
end
