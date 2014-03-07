class CreateLeaseWells < ActiveRecord::Migration
  def change
    create_table :lease_wells do |t|
      t.integer :lease_id
      t.integer :well_id

      t.timestamps
    end
  end
end
