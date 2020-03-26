class TestsController < ApplicationController
#  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[start show destroy edit update]
  before_action :set_user, only: :start
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
  end

  def edit

  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.user_passed_test(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def set_user
    @user = User.first
  end
end
