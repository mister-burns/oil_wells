class RemoveTrackingAndApiFromWell < ActiveRecord::Migration
  def change
    remove_column :wells, :tracking_number, :string
    remove_column :wells, :api_number, :string
  end
end
