class TestsController < ApplicationController

  before_action :find_test, only: %i[show destroy]

  def index
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
