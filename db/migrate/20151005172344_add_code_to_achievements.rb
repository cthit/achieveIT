class AddCodeToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :code, :string
  end
end
