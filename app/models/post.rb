class Post < ActiveRecord::Base
  belongs_to :user

  def self.visible_to(user)
    if user.try(:admin?)
      all
    else
      where(["approved=? OR user_id=?", true, user.try(:id)])
    end
  end

  def visible_to?(user)
    approved? || user.try(:admin?) || user == self.user
  end
end
