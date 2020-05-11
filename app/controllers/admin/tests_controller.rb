class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[start show destroy edit update]

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
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

    private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
