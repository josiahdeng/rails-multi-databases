class BlogMustache < BaseMustache
  attr_accessor :blog_arrs

  BlogStruct = Struct.new(:name)

  def initialize(blogs)
    @blog_arrs = []
    blogs.each do |b|
      @blog_arrs << BlogStruct.new(b.name)
    end
  end


end