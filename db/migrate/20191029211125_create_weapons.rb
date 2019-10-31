class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :attack_bonus
      t.integer :life_bonus
      t.references :warrior, foreign_key: true

      t.timestamps
    end
  end
end
