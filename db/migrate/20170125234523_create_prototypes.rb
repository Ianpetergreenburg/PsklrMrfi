class CreatePrototypes < ActiveRecord::Migration[5.0]
  def change
    create_table :prototypes do |t|
      t.integer :height, null: false
      t.integer :weight, null: false
      t.string :model_no, null: false, unique: true
      t.integer :manufacturer_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
