class Lining < ApplicationRecord
  has_many :kits
  validates :name, presence: true
end
