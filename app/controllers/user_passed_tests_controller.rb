class UserPassedTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[result show update destroy]

  def show
  end

  def result
  end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed?
      TestsMailer.completed_test(@user_passed_test).deliver_now
      redirect_to result_user_passed_test_path(@user_passed_test)
    else
      render :show
    end
  end

  private

  def set_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
