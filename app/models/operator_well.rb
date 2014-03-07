class OperatorWell < ActiveRecord::Base
  belongs_to :operator
  belongs_to :well

  validates :operator_id, :uniqueness => { :scope => :well_id }
end
