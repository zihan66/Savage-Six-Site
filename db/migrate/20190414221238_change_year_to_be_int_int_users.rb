class ChangeYearToBeIntIntUsers < ActiveRecord::Migration[5.2]
  def change
    User.where(classyear:'{1=>2019, 2=>2, 3=>1}').update_all({classyear: '0'})
    change_column :users, :classyear, :integer, using: 'classyear::integer'
    change_column_null :users, :classyear, 0
    change_column_default :users, :classyear, 0
  end

end
