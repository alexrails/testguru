class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.present?
      current_user.tests.push(@test)
      redirect_to current_user.user_passed_test(@test)
    else
      redirect_to root_path, alert: "Sorry, but this test has no questions!"
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
