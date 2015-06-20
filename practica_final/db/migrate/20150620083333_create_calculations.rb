class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.string :name
      t.integer :post_code
      t.string :phone_number
    end
  end
end
