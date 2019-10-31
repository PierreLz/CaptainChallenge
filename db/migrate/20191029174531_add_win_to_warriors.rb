class AddWinToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_column :warriors, :win, :integer, :default => 0
  end
end
