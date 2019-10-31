class AddWarrior1ToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :warrior1_id, :integer
  end
end
