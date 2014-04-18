class ChangeAchDescToText < ActiveRecord::Migration
  def up
   change_column :achievements, :desc, :text
  end

  def down
   change_column :achievements, :desc, :string
  end
end
