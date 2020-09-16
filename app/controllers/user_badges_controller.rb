class UserBadgesController < ApplicationController

  def index
    @badges = current_user.badges
  end

  def all_badges
    @badges =  Badge.all
  end

end
