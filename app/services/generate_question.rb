class GenerateQuestion
	def initialize(test)
		@test = test
		create_question
	end

	def create_question
		@test.questions.create correct_word: pick_correct_word.id, false_word: pick_false_words
	end

	def pick_correct_word
		@correct_word = Word.where(id: Word.pluck(:id).sample(1)).take
	end

	def pick_false_words
		false_answers = Word.where('id != ?', @correct_word.id)
							.pluck(detect_test_type.to_sym)
							.sample(3) 
	end

	def detect_test_type
		case @test.test_type
		when 'chinese_english'
			'english'
		when 'english_chinese'
			'chinese'
		when 'chinese_pinyin'
			'pinyin'
		end
	end
end
