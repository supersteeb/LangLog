class ChangeColumnDataType < ActiveRecord::Migration[5.0]
  def change
  	change_column :words, :times_tested, :decimal
  	change_column :words, :times_correct, :decimal
  end
end
