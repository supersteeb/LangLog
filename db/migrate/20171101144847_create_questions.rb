class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :test, foreign_key: true
      t.integer :correct_word
      t.text :false_word, array: true, default: []

      t.timestamps
    end
  end
end
