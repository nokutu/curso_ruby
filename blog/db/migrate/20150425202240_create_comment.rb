class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :reply_to, index: true
      t.belongs_to :post, index: true
      t.belongs_to :author, index: true

      t.timestamps null: false
    end
  end
end
