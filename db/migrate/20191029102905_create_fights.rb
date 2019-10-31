class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|

      t.timestamps
    end
  end
end
