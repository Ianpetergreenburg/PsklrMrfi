class CreateManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :manufacturers do |t|
      t.string :name, { null:false }
      t.timestamps null:false
    end
  end
end
