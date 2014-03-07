class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.string :name
      t.integer :lease_number

      t.timestamps
    end
  end
end
