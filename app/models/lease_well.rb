class LeaseWell < ActiveRecord::Base
  belongs_to :lease
  belongs_to :well

  validates :lease_id, :uniqueness => { :scope => :well_id }

end
