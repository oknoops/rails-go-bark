class AddStartDateToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :start_date, :datetime
  end
end
