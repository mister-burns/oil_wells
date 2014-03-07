class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :name
      t.integer :operator_number

      t.timestamps
    end
  end
end
