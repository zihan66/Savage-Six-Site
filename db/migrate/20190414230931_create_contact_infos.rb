class CreateContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_infos do |t|
      t.string :title
      t.string :info

      t.timestamps
    end
  end
end
