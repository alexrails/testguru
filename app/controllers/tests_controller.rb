class TestsController < ApplicationController
#  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[show destroy edit]

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

  end

  def destroy
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
