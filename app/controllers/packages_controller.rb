class PackagesController < ApplicationController
  before_filter :restrict_access
  def index
    @packages = Package.all

    render json: @packages
  end



  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)
    @package.user_id = @current_user.id
    if @package.save
      render json: @package, status: :created, location: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    @package = Package.find(params[:id])
    #TODO: check only correct packages are updated
    if @package.update(package_params)
      head :no_content
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    head :no_content
  end

  private

  def package_params
    params.require(:package).permit(:tittle, :description, :src_lat, :src_lon, :dest_lat, :dest_lon, :delivered, :image)
  end
end
