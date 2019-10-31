class Weapon < ApplicationRecord
  belongs_to :warrior, optional: :true
  validates :name, presence: :true
  validates :attack_bonus, presence: :true
  validates :life_bonus, presence: :true
end
