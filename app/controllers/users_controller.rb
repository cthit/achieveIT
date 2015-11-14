class UsersController < ApplicationController
  before_action :verify_access

  def index
  	@users = Unlock.all().map(&:cid).uniq
  end

  def show
    @unlocks = Unlock.for_user(params[:id]).includes(:achievement)
    @achievements = @unlocks.map(&:achievement)
    @points = @achievements.map(&:points).reduce(0, :+)
    @nick = nick(params[:id])

  end
end
