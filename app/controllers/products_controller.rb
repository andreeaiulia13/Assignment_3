class ProductsController < ApplicationController
  before_action :set_product, only:[:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end

  def show
  end

  def dashboard
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def nil_params
    product_params[:image].blank? || product_params[:description].blank? || product_params[:price].blank? || product_params[:title].blank?
  end

  def create
    unless (nil_params) then
      product = Product.create!(product_params.except(:image))
      product.image.attach(product_params[:image])
      redirect_to dashboard_path
    end
  end

  def edit
  end

  def update
    unless (product_params[:description].blank? || product_params[:title].blank? || product_params[:price].blank?) then
      @product.update(product_params)
      redirect_to dashboard_path
    end
  end

  def destroy
    @product.destroy
    redirect_to dashboard_path
  end
  
  private

  def set_product
     @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end

end

