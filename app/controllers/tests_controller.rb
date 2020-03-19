class TestsController < ApplicationController
#  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[show destroy]

  def index
    @tests = Test.all
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
