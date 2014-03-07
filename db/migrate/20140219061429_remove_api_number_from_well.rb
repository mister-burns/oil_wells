class RemoveApiNumberFromWell < ActiveRecord::Migration
  def change
    remove_column :wells, :api_number, :integer
  end
end
