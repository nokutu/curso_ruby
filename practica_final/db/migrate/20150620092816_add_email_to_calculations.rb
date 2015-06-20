class AddEmailToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations, :email, :string
  end
end
