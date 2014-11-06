module PostsHelper
  def markdownify(raw)
    Guestbook::HTML.process(raw)
  end
end
