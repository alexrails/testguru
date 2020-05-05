class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
