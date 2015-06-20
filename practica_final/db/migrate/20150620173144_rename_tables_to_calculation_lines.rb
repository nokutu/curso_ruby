class RenameTablesToCalculationLines < ActiveRecord::Migration
  def change
    rename_table :tables, :calculation_lines
  end
end
