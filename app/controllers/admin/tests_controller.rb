class Admin::TestsController < Admin::BaseController

  # skip_before_action :authenticate_user!, only: :index
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    # flash[:notice] = "Welcome, #{current_user.first_name}" if current_user.admin?
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render 'new'
    end
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render 'edit'
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render html: "Error: test with id: #{params[:id]} not found"
  end
end
