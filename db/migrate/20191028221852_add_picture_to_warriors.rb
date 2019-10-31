class AddPictureToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_column :warriors, :picture, :string
  end
end
