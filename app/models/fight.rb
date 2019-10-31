class Fight < ApplicationRecord
  has_many :warriors
  validates :warrior1_id, presence: :true
  validates :warrior2_id, presence: :true
  validates :weapon1_id, presence: :true
  validates :weapon2_id, presence: :true
end
