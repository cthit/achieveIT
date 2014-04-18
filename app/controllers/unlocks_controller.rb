class UnlocksController < ApplicationController

  before_action :set_unlock, only: [:edit, :update, :destroy]

  def index
    @unlocks = Unlock.all.group(:cid)
  end

  def create
    @unlock = Unlock.new(unlock_params)
    if @unlock.save
      render json: @unlock, status: :created, location: @unlock
    else
      render json: @unlock.errors, status: :unprocessable_entity
    end
  end

  def update
    if @unlock.update(unlock_params)
      redirect_to(unlocks_url)
    else
      render json: @unlock.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @unlock.destroy
    redirect_to(unlocks_url)
  end

  private
  def unlock_params
    params.require(:unlock).permit(:cid, :achievement_id)
  end

  def set_unlock
    @unlock = Achievement.find(params[:id])
  end

end
