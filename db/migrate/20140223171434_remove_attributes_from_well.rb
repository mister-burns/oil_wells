class RemoveAttributesFromWell < ActiveRecord::Migration
  def change
    remove_column :wells, :operator_name, :string
    remove_column :wells, :operator_number, :integer
    remove_column :wells, :lease_number, :integer
    remove_column :wells, :lease_name, :string
  end
end
