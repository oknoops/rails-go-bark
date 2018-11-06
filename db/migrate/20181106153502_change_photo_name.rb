class ChangePhotoName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :photo, :avatar
  end
end
