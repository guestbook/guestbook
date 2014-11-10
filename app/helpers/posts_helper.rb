module PostsHelper
  # Process and cache raw text as markdown, outputting HTML.
  #
  # raw - A String containing markdown syntax.
  #
  # Returns a String.
  def markdownify(raw)
    hash = Digest::MD5.hexdigest(raw)
    Rails.cache.fetch(Guestbook.cache_key("markdown:#{hash}")) do
      markdownify_without_cache(raw)
    end
  end

  # Process raw text as markdown, outputting HTML.
  #
  # raw - A String containing markdown syntax.
  #
  # Returns a String.
  def markdownify_without_cache(raw)
    Guestbook::HTML.process(raw)
  end
end
