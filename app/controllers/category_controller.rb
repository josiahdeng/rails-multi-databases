class CategoryController < ApplicationController
  before_action :find_by_id, only: [:edit, :update, :destroy]

  def index
    @categories = initialize_grid(Category, order: :lft)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(allow_params)
    if @category.valid?
      @category.save(validate: false)
      flash[:notice] = "创建成功！"
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    @category.attributes = allow_params
    if @category.valid?
      @category.save(validate: false)
      flash[:notice] = "修改成功！"
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "删除成功！"
    redirect_to action: :index
  end

  private
  def allow_params
    params.require(:category).permit(:name, :parent_id)
  end

  def find_by_id
    @category = Category.where(id: params[:id]).first
    if @category.blank?
      flash[:error] = "该id不存在。"
      redirect_to action: :index
    end
  end
end