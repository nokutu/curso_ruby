class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :surname
      t.string :nickname
      t.string :email

      t.timestamps null: false
    end
  end
end
