class ChangeLogColumnInTest < ActiveRecord::Migration[5.0]
  def change
  	change_column :tests, :logs, :jsonb, default: {}, null: false
  end
end
