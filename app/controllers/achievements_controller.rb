class AchievementsController < ApplicationController

  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  def index
    @achievements = Achievement.all
  end

  def new
    @achievement = Achievement.new(points: 0)
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save 
      redirect_to(@achievement)
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @achievement.update(achievement_params)
      redirect_to(@achievement)
    else
      render action: 'edit'
    end
  end

  def destroy
    @achievement.destroy
    redirect_to(achievements_url)
  end

  def show
  end

  private
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    def achievement_params
      params.require(:achievement).permit(:name, :desc, :provider, :category, 
                                          :points)
    end

end
