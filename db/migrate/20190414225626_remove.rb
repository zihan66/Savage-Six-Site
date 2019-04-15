class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :users,:classyear
  end
end
