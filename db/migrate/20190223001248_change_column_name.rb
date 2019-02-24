class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :user, :FirstName,:firstname
  end
end
