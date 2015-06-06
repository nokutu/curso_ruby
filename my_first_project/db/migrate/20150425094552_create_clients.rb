class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :NIF

      t.timestamps null: false
    end
  end
end
