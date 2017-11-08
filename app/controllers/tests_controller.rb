class TestsController < ApplicationController
	before_action :set_test , only: [:show, :submit_answer]

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
		grade = 0
		user_submission = JSON.parse(params[:user_submission])
		user_submission.each do |question, value|
			question = Question.find(question.split('-').last.to_i)
			correct_word = Word.find question.correct_word
			if value == correct_word.send(@test.test_type.split('_').last)
				result << {question_id: question.id, correct: true}
				correct_word.update times_correct: correct_word.times_correct + 1
				grade += 1
			else
				result << {question_id: question.id, correct: false}
			end
			correct_word.update times_tested: correct_word.times_tested + 1
		end
		@test.logs["#{Time.now.to_i}"] = result
		@test.save
		redirect_back(fallback_location: tests_path)
		#answer: correct_word.send(@test.test_type.split('_').last)
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
