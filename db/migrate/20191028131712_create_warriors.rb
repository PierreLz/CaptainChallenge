class CreateWarriors < ActiveRecord::Migration[6.0]
  def change
    create_table :warriors do |t|
      t.string :name
      t.integer :life
      t.integer :attack_point

      t.timestamps
    end
  end
end
