class AddFlowRatesToWell < ActiveRecord::Migration
  def change
    add_column :wells, :oil_24_hour, :float
    add_column :wells, :gas_24_hour, :float
    add_column :wells, :water_24_hour, :float
  end
end
