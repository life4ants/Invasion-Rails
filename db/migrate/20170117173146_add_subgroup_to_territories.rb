class AddSubgroupToTerritories < ActiveRecord::Migration[5.0]
  def change
    add_column :territories, :subgroup, :string
    add_index :territories, :subgroup
  end
end
