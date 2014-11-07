require_relative "guestbook/html"

module Guestbook
  # The current tag version of the repo this app is running.
  #
  # Returns a String.
  def version
    "v1.2"
  end

  extend self
end
