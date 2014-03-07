class AddAttributesToWell < ActiveRecord::Migration
  def change
    add_column :wells, :drilling_permit_number, :integer
    add_column :wells, :operator_number, :integer
    add_column :wells, :submit_date, :date
    add_column :wells, :lease_number, :integer
    add_column :wells, :lease_name, :string
    add_column :wells, :well_number, :string
    add_column :wells, :status, :string
    add_column :wells, :packet_type, :string
  end
end
