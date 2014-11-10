require_relative "guestbook/html"

module Guestbook
  # Cache version.
  #
  # Returns an Integer.
  def cache_version
    1
  end

  # Get a versioned cache key.
  #
  # key - The cache key to add a version to.
  #
  # Returns a String.
  def cache_key(key)
    "cache:#{cache_version}:#{key}"
  end

  extend self
end
