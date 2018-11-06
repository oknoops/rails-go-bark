class ChangeDateToEndDateInContracts < ActiveRecord::Migration[5.2]
  def change
    rename_column :contracts, :date, :end_date
  end
end
