class Writer::WriterController < ApplicationController
  before_action :find_writer, only: [:edit, :update, :destroy]

  #首页
  def index
    @writers = initialize_grid(Writer::Writer, order: :id)
  end

  #新建
  def new
    @writer = Writer::Writer.new
  end

  #创建
  def create
    @writer = Writer::Writer.new(allow_params)
    @writer.save
    flash[:notice] = "创建成功"
    redirect_to action: :index
  end

  #编辑
  def edit
  end

  #更新
  def update
    @writer.attributes = allow_params
    @writer.save
    flash[:notice] = "更新成功"
    redirect_to action: :index
  end

  #删除
  def destroy
    @writer.destroy
    flash[:notice] = "删除成功"
    redirect_to action: :index
  end

  private
  def allow_params
    params.require("writer_writer").permit(:name)
  end

  def find_writer
    @writer = Writer::Writer.where(id: params[:id]).first
    if @writer.blank?
      flash[:error] = "找不到此id的数据"
      redirect_to action: :index
    end
  end
end