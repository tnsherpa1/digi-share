class AddTenantIdToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :tenant_id, :integer
  end
end
