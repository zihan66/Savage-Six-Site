class ChangeYearToBeIntIntUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :classyear, :integer, using: 'classyear::integer'
    change_column_default :users, :classyear, 0
    change_column_null :users, :classyear, 0
  end
end
