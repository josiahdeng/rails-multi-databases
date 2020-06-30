class BooleanBlogMustache < BaseMustache
  attr_accessor :blogs_arr

  BooleanBlogMustache = Struct.new(:name, :is_published, :writer_name, :wrapped)

  def initialize(blogs)
    @blogs_arr = []
    blogs.each do |blog|
      @blogs_arr << BooleanBlogMustache.new(blog.name, blog.published, blog.writer.name, lambda{|text| "<b>#{text}</b>"})
    end
  end

  def test_define
    "test_define"
  end
end