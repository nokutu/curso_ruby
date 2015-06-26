class RemoveCodeFromCalculations < ActiveRecord::Migration
  def change
    remove_column :calculations, :code
  end
end
