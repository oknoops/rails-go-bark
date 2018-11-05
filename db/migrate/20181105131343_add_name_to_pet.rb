class AddNameToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :name, :string
  end
end
