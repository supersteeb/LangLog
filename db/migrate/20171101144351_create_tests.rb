class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.references :user, foreign_key: true
      t.jsonb :logs
      t.integer :test_type

      t.timestamps
    end
  end
end
