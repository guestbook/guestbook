require "html/pipeline"

module Guestbook
  module HTML
    FILTERS = [
      ::HTML::Pipeline::MarkdownFilter,
      ::HTML::Pipeline::SanitizationFilter,
      ::HTML::Pipeline::ImageMaxWidthFilter
    ]

    WHITELIST = {
      :elements        => %w(b i strong em a pre code img ins del sup sub p ol ul li),
      :remove_contents => ['script'],
      :attributes      => {
        'a'   => %w(href),
        'img' => %w(src),
        :all  => %w(name id class)
      },
      :protocols => {
        'a'   => {'href' => %w(http https)},
        'img' => {'src'  => %w(http https)}
      }
    }

    PIPELINE = ::HTML::Pipeline.new(FILTERS, :whitelist => WHITELIST)

    # Convert raw text containing markdown syntax into HTML.
    #
    # raw - A String containing markdown syntax.
    #
    # Returns a String.
    def process(raw)
      PIPELINE.call(raw)[:output].to_s.html_safe
    end

    extend self
  end
end
