class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.text :description
      t.integer :price_per_day
      t.integer :size
      t.string :location
      t.string :purpose

      t.timestamps
    end
  end
end
