class AddIndexToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :libraries, :tenant_id
  end
end
