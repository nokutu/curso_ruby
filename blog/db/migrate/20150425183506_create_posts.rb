class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :author, index: true
      t.text :intro
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
