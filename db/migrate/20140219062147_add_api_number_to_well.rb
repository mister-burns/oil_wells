class AddApiNumberToWell < ActiveRecord::Migration
  def change
    add_column :wells, :api_number, :bigint
  end
end
