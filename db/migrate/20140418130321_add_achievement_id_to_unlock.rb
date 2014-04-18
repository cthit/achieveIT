class AddAchievementIdToUnlock < ActiveRecord::Migration
  def change
    add_reference :unlocks, :achievement, index: true
  end
end
