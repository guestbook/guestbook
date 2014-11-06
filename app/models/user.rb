class User < ActiveRecord::Base
  has_many :posts
  # Find or create a user from an Omniauth auth-hash.
  #
  # auth-auth - An auth-hash as set in the request env my Omniauth.
  #
  # Returns a User object.
  def self.find_or_create_from_auth_hash(auth_hash)
    github_id  = auth_hash["uid"]
    info = auth_hash["info"]
    user = find_by_github_id(github_id) || new(:github_id => github_id)
    user.github_login = auth_hash["info"]["nickname"]
    user.github_avatar_url = auth_hash["info"]["image"]
    user.admin = user.github_login == "guestbook"
    user.save!
    user
  end
end
