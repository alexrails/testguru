class UserPassedTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[result show update gist]

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

  def gist
    result = GistQuestionService.new(@user_passed_test.current_question).call

    flash_options = if result.success?
      { notice: t('.success') }
    else
      { alert: t('.failure') }
    end

    redirect_to @user_passed_test, flash_options
  end

  private

  def set_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
