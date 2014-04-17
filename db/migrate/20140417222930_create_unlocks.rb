class CreateUnlocks < ActiveRecord::Migration
  def change
    create_table :unlocks do |t|
      t.string :cid

      t.timestamps
    end
  end
end
