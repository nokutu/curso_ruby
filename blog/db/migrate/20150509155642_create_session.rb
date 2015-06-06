class CreateSession < ActiveRecord::Migration
  def change
    create_table :sessions, id: false do |t|
      t.string :cookie, null: false
      t.belongs_to :author, index: true

      t.datetime :created_at
    end
  end
end
