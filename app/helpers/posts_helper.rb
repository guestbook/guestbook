module PostsHelper
  # Process raw text as markdown, outputting HTML.
  #
  # raw - A String containing markdown syntax.
  #
  # Returns a String.
  def markdownify(raw)
    Guestbook::HTML.process(raw)
  end
end
