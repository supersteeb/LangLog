class TestsController < ApplicationController
	before_action :set_test , only: [:show, :submit_answer, :result]

	def index
		@tests = current_user.tests
	end

	def show
		@questions = []
		@test.questions.each do |question|
			correct_word = Word.find(question.correct_word)
			options = question.false_word << correct_word.send(@test.test_type.split('_').last)
			@questions << { id: question.id,
							question: "What is the #{@test.test_type.split('_').last} of '#{correct_word.send(@test.test_type.split('_').first)}'?'" , 
							options: options.shuffle
						   }
		end		
	end

	def submit_answer
		result = [] #empty array
		n_o_correct_question = 0
		user_submission = JSON.parse(params[:user_submission])
		@test.questions.each do |question|
			value = user_submission["question-#{question.id}"]
			correct_word = Word.find question.correct_word
			correct_word_data = correct_word.send(@test.test_type.split('_').last)
			if value['answered'] == correct_word_data
				result << {question_id: question.id, 
						   correct: true,
						   question_text: value['question'],
						   question_word: correct_word_data, 
						   user_submission: value['answered']}
				correct_word.update times_correct: correct_word.times_correct + 1
				n_o_correct_question += 1
			else
				result << {question_id: question.id, 
						   correct: false, 
						   question_text: value['question'],
						   question_word: correct_word_data, 
						   user_submission: value['answered']}
			end
			correct_word.update times_tested: correct_word.times_tested + 1
		end
		@test.logs["#{Time.now.to_i}"] = {result: result, grade: ((n_o_correct_question.to_f/15.0)*100).round}
		@test.save
		redirect_to result_tests_path		
	end

	def result
		@result = @test.logs 
	end

	def create
		test = current_user.tests.create(test_type: params[:type])
		15.times do
			GenerateQuestion.new(test)
		end
		redirect_to show_tests_path(id: test.id)
	end

	private
	def set_test
		@test = Test.find(params[:id])
	end
end
