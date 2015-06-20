class TableIdToPetitionId < ActiveRecord::Migration
  def change
    rename_column :calculation_lines, :table_id, :calculation_id
  end
end
