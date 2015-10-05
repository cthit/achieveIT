class ChangeProviderToId < ActiveRecord::Migration
  def up
    rename_column :achievements, :provider, :provider_id

    change_column :achievements, :provider_id, :integer
    add_index :achievements, :provider_id
  end
end
