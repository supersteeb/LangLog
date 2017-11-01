class CreateDictionaries < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionaries do |t|
      t.references :user, foreign_key: true
      t.string :chinese
      t.string :english
      t.string :pinyin
      t.string :part_of_speech
      t.integer :times_tested
      t.integer :times_correct

      t.timestamps
    end
  end
end
