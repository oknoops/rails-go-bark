class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
  end
end
