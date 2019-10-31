class AddWarrior2ToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :warrior2_id, :integer
  end
end
