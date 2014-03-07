class Lease < ActiveRecord::Base
  has_many :lease_wells
  has_many :wells, :through => :lease_wells

  has_many :lease_operators
  has_many :operators, :through => :lease_operators

  validates :name, uniqueness: true, presence: true
end
