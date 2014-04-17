class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :desc
      t.string :provider
      t.string :category
      t.integer :points

      t.timestamps
    end
  end
end
