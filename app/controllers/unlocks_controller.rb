class UnlocksController < ApplicationController

  before_action :set_unlock, only: [:show, :edit, :update, :destroy]

  def index
    @unlocks = Unlock.all
  end

  def create
    @unlock = Unlock.new(unlock_params)
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
    params.require(:unlock).permit(:cid, :achievement_id)
  end

  def set_unlock
    @unlock = Unlock.find(params[:id])
  end

end
