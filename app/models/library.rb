class Library < ApplicationRecord
  belongs_to :tenant
  validates_uniqueness_of :name
  validates_presence_of :name

  def self.tenant_and_lib(tenant_id)
    tenant = Tenant.find(tenant_id)
    tenant.libraries
  end
end
