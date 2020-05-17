class Vehicle < ApplicationRecord
  has_many :locations, dependent: :destroy
  validates_uniqueness_of :identifier
end
