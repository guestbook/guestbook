class Post < ActiveRecord::Base
  belongs_to :user
  default_scope order('created_at DESC')

  # Get posts that should be visible to a given user.
  #
  # user - The User to check permissions for.
  #
  # Returns an Array of Posts.
  def self.visible_to(user)
    if user.try(:admin?)
      all
    else
      where(["approved=? OR user_id=?", true, user.try(:id)])
    end
  end

  # Check if this post is visible to a given user.
  #
  # user - The User to check permissions for.
  #
  # Returns a boolean.
  def visible_to?(user)
    approved? || user.try(:admin?) || user == self.user
  end
end
