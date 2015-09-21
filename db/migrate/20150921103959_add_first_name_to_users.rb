class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :Last_name, :last_name
  end
end
