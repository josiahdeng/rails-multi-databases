class UserMail < ApplicationMailer
  def send_mail(blogs)
    blog_mustache = BooleanBlogMustache.new(blogs)
    pp mail_body = blog_mustache.render
    mail(from: "lucian", to: "1024462231@qq.com", subject: "test mail", body: mail_body)
  end
end