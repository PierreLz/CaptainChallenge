class AddWeapon2ToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :weapon2_id, :integer
  end
end
