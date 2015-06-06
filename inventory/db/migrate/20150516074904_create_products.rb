class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :kind
      t.boolean :lent, :default => false
      t.boolean :lendable, :default => true
      t.text :description
      t.decimal :pricenew, :precision => 10, :scale => 2
      t.decimal :pricenow, :precision => 10, :scale => 2
      t.string :state
      t.attachment :image

      t.datetime :created_at
    end
  end
end
