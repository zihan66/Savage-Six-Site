class ChangeYearToBeIntIntUsers < ActiveRecord::Migration[5.2]
  def up
    User.where("classyear IS NULL OR classyear = '{1=>2019, 2=>2, 3=>1}'").update_all({ccy: '0'})
    change_column :users, :classyear, :integer, using: 'classyear::integer'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
