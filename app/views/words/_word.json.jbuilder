json.extract! word, :id, :user_id, :chinese, :english, :pinyin, :part_of_speech, :mnemonic, :times_tested, :times_correct, :created_at, :updated_at
json.url word_url(word, format: :json)
