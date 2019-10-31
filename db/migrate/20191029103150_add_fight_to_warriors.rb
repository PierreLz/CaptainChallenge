class AddFightToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_reference :warriors, :fight, foreign_key: true
  end
end
