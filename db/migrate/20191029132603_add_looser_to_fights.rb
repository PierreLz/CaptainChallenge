class AddLooserToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :looser, :string
  end
end
