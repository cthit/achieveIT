class UnlocksController < ApplicationController
  before_action :restrict_access, only: [:create, :update, :destroy]

  before_action :set_unlock, only: [:show, :edit, :update, :destroy]

  def index
    @unlocks = Unlock.all
    if params[:cid]
      @unlocks = @unlocks.for_user(params[:cid]).includes(:achievement)
    end

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

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @provider = Provider.find_by(api_key: token)
      @provider.present?
    end
  end

end
