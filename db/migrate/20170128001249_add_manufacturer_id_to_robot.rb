class AddManufacturerIdToRobot < ActiveRecord::Migration[5.0]
  def change
    add_column :robots, :manufacturer_id, :integer
  end
end
