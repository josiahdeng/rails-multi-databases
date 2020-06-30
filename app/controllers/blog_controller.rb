class BlogController < ApplicationController

  before_action :find_blog, only: [:edit, :update, :destroy]

  #首页
  def index
    @blogs = initialize_grid(Blog.includes(:writer), order: :id)
  end

  #新建
  def new
    @blog = Blog.new
  end

  #创建
  def create
    @blog = Blog.new(allow_params)
    @blog.save
    flash[:notice] = "创建成功"
    redirect_to action: :index
  end

  #编辑
  def edit
  end

  #更新
  def update
    @blog.attributes = allow_params
    @blog.save
    flash[:notice] = "更新成功"
    redirect_to action: :index
  end

  #删除
  def destroy
    @blog.destroy
    flash[:notice] = "删除成功"
    redirect_to action: :index
  end

  #测试邮件模板
  def test_mustache
    blogs = Blog.all
    UserMail.send_mail(blogs).deliver
  end

  private
  def allow_params
    params.require("blog").permit(:name, :writer_id, :published, :category_id)
  end

  def find_blog
    @blog = Blog.where(id: params[:id]).first
    if @blog.blank?
      flash[:error] = "找不到此id的数据"
      redirect_to action: :index
    end
  end
end