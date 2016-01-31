class Admin::ProductsController < ApplicationController
   before_action :set_product, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  layout "admin"

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: '成功新增商品!'
    else
      render :new
    end
   # respond_to do |format|
   #   if @product.save
   #     format.html { redirect_to admin_products_path, notice: '成功新增商品!' }
   #     format.json { render :show, status: :created, location: @product }
   #   else
   #     format.html { render :new }
   #     format.json { render json: @product.errors, status: :unprocessable_entity }
   #   end
   # end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
       redirect_to [:admin, @product], notice: 'Product was successfully update'
    else
        render :edit 
    end
   # respond_to do |format|
   #   if @product.update(product_params)
   #     format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
   #     format.json { render :show, status: :ok, location: @product }
   #   else
   #     format.html { render :edit }
   #     format.json { render json: @product.errors, status: :unprocessable_entity }
   #   end
   # end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
   # respond_to do |format|
   #   format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
   #   format.json { head :no_content }
   # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image)
    end

end
