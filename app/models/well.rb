class Well < ActiveRecord::Base
  has_many :operator_wells
  has_many :operators, :through => :operator_wells

  has_many :lease_wells
  has_many :leases, :through => :lease_wells

  validates :tracking_number, uniqueness: true, presence: true, :length => { :is => 5 }
end
