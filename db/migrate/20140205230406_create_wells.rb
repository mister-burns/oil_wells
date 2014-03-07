class CreateWells < ActiveRecord::Migration
  def change
    create_table :wells do |t|
      t.string :tracking_number
      t.string :api_number
      t.string :operator_name

      t.timestamps
    end
  end
end
