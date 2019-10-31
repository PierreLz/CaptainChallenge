class AddWinnerToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :winner, :string
  end
end
