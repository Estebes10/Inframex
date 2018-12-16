class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @suppliers.map(&:name)
  end
end
