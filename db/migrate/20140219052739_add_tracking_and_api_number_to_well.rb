class AddTrackingAndApiNumberToWell < ActiveRecord::Migration
  def change
    add_column :wells, :tracking_number, :integer
    add_column :wells, :api_number, :integer
  end
end
