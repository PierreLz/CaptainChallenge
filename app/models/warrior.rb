class Warrior < ApplicationRecord
  belongs_to :fight, optional: true
  has_many :weapons
  validates :name, presence: :true, length: { minimum: 3, maximum: 30 }, uniqueness: true
  validates :life, presence: :true, numericality: { greater_than: 1, less_than: 501 }
  validates :attack_point, presence: :true, numericality: { greater_than: 1, less_than: 51 }
  validates :dexterity_points, presence: :true, numericality: { greater_than: 1, less_than: 31 }
end
