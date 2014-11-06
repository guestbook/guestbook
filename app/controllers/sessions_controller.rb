class SessionsController < ApplicationController
  skip_before_filter :login_required, only: ["create"]

  def create
    if user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
      self.current_user = user
    end
    redirect_to "/"
  end
end
