class UnlocksController < ApplicationController
  before_action :restrict_access, only: [:create, :update, :destroy]

  before_action :set_unlock, only: [:show, :edit, :update, :destroy]

  def index
    @unlocks = Unlock.order(created_at: :desc).includes(:achievement)
    @achievements = @unlocks.map(&:achievement)
  end

  def create
    params = unlock_params
    @achievement = Achievement.find_by(provider: @provider, code: params[:code])

    @unlock = @achievement.unlocks.build(cid: params[:cid])

    if @unlock.save
      render json: @unlock, status: :created, location: @unlock
    else
      render json: @unlock.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @unlock.destroy
    redirect_to(unlocks_url)
  end

  def show
  end

  private
  def unlock_params
    params.require(:unlock).permit(:cid, :code)
  end

  def set_unlock
    @unlock = Unlock.find(params[:id])
  end

end
