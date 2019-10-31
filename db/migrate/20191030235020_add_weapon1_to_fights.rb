class AddWeapon1ToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :weapon1_id, :integer
  end
end
