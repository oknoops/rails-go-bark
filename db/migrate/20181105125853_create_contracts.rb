class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
