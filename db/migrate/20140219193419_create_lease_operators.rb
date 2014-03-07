class CreateLeaseOperators < ActiveRecord::Migration
  def change
    create_table :lease_operators do |t|
      t.integer :lease_id
      t.integer :operator_id

      t.timestamps
    end
  end
end
