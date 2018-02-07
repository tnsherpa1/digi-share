class LibrariesController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy, :users, :add_user]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant

  def index
    @tenant = Tenant.current_tenant
    @libraries = Library.tenant_and_lib(@tenant.id)
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)
    respond_to do |format|
      if @library.save
        format.html { redirect_to root_url, notice: 'Library was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end

  private

  def library_params
    params.require(:library).permit(:name, :description, :tenant_id)
  end

  def set_tenant
    @tenant = Tenant.find(params[:tenant_id])
  end

  def verify_tenant
    unless params[:tenant_id] == Tenant.current_tenant_id.to_s
    redirect_to :root,
    flash: { error: 'You only have access to libraries that you have permissions for' }
    end
  end
end
