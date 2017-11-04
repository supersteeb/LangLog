class TestsController < ApplicationController
	before_action :set_test, only: [:show]

	def index
		@tests = Test.all
	end

	def show
	end

	def create
		test = current_user.tests.create(test_type: rand(0..2))
		GenerateQuestion.for(test)
		redirect_to show_tests_path(id: test.id)
	end

	private
	def set_test
		@test = Test.find(params[:id])
	end
end
