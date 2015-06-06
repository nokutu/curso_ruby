class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.text :description
      t.date :lend_start_date
      t.date :lend_end_date
      t.boolean :accepted
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true

      t.datetime :created_at
    end
  end
end
