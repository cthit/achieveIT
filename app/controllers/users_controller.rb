class UsersController < ApplicationController
  def show
    @unlocks = Unlock.for_user(params[:id]).includes(:achievement)
    @achievements = @unlocks.map(&:achievement)
  end
end
