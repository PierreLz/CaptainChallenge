class AddDexterityPointToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_column :warriors, :dexterity_points, :integer
  end
end
