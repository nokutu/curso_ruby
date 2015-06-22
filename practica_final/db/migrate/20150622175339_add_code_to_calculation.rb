class AddCodeToCalculation < ActiveRecord::Migration
  def change
    add_column :calculations, :code, :string
  end
end
