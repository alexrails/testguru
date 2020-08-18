class UserPassedTestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[result show update gist]

  def show
  end

  def result
  end

  def update
    @user_passed_test.accept!(params[:answer_ids]) if params[:answer_ids]

    if @user_passed_test.completed?
      badges = GetBadgeService.new(@user_passed_test).call

      if badges.present?
        current_user.badges.push(badges)
        flash[:notice] = "You got a new achievement!"
      end

      TestsMailer.completed_test(@user_passed_test).deliver_now
      redirect_to result_user_passed_test_path(@user_passed_test)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@user_passed_test.current_question)

    result = service.call

    flash_options = if service.success?
      current_user.gists.create(question: @user_passed_test.current_question, url: service.gist_url)
      { notice: t('.success', url: service.gist_url) }
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
