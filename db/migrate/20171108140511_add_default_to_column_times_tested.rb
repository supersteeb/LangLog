class AddDefaultToColumnTimesTested < ActiveRecord::Migration[5.0]
  def change
  	change_column :words, :times_tested, :integer, default: 0
  	change_column :words, :times_correct, :integer, default: 0
  end
end
