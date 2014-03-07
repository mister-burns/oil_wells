class CreateOperatorWells < ActiveRecord::Migration
  def change
    create_table :operator_wells do |t|
      t.integer :operator_id
      t.integer :well_id

      t.timestamps
    end
  end
end
