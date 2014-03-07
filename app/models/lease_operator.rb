class LeaseOperator < ActiveRecord::Base
  belongs_to :lease
  belongs_to :operator

  validates :lease_id, :uniqueness => { :scope => :operator_id }

end
