class AddLoseToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_column :warriors, :lose, :integer, :default => 0
  end
end
