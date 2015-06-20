class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.belongs_to :table, index: true
      t.belongs_to :product, index:true
      t.integer :hours
      t.integer :amount
    end
  end
end
