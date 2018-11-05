class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.integer :price
      t.string :specie
      t.string :breed
      t.string :photo

      t.timestamps
    end
  end
end
