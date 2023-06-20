class AddPhotoToTents < ActiveRecord::Migration[7.0]
  def change
    add_column :tents, :photo_url, :string
  end
end
