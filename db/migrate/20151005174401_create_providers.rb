class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :api_key
      t.string :name

      t.timestamps null: false
    end
  end
end
