class AddExperienceToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_column :warriors, :experience, :integer, :default => 0
  end
end
