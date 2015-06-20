class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :name_led
      t.string :name_incandescent
      t.decimal :price_led, :precision => 10, :scale => 2
      t.integer :power_incandescent
      t.integer :power_led
    end
  end
end
