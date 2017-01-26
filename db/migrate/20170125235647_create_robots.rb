class CreateRobots < ActiveRecord::Migration[5.0]
  def change
    create_table :robots do |t|
      t.string :designation
      t.integer :height
      t.integer :weight
      t.string :model_no
      t.boolean :pending, default: false
       
      t.timestamps
    end
  end
end
