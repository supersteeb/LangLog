class TestsController < ApplicationController
	before_action :set_test, only: [:show]

	def index
		@tests = current_user.tests
	end

	def show
		@questions = []
		@test.questions.each do |question|
			correct_word = Word.find(question.correct_word)
			options = question.false_word << correct_word.send(@test.test_type.split('_').last)
			@questions << {question: "What is the meaning of #{correct_word.send(@test.test_type.split('_').first)}?" , 
							options: options, 
							answer: correct_word.send(@test.test_type.split('_').last)}
		end
		
	end

	def create
		test = current_user.tests.create(test_type: rand(0..2))
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
