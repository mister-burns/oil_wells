class Operator < ActiveRecord::Base
  has_many :operator_wells
  has_many :wells, :through => :operator_wells

  has_many :lease_operators
  has_many :leases, :through => :lease_operators

  validates :name, uniqueness: true, presence: true
end
