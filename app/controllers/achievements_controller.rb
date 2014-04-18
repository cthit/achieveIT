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
    respond_to do |format| 
      if @achievement.save 
        format.html { redirect_to(@achievement) }
        format.json { render json: @achievement, 
                            status: :created, 
                            location: @achievement}
      else
        format.html {render action: 'new'}
        format.json {render json: @achievement.errors, 
                          status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format| 
      if @achievement.update(achievement_params)
        format.html { redirect_to(@achievement) }
        format.json { head :no_content }
      else
        format.html {render action: 'edit'}
        format.json {render json: @achievement.errors, 
                          status: :unprocessable_entity}
      end
    end
  end

  def destroy
    respond_to do |format| 
      @achievement.destroy
      format.html { redirect_to(achievements_url) }
      format.json { head :no_content }
    end
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
