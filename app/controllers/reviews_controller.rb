class ReviewsController < ApplicationController
  before_action :set_product
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @reviews = @product.reviews if @product.present?
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    puts 
    @review = @product.reviews.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to product_reviews_path(product_id: params[:product_id]), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to product_review_path(product_id: @product.id), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @product = Product.find(params[:product_id])
      @review = Review.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      @product = Product.find(params[:product_id])
      params.require(:review).permit(:description, :rating, :product_id).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.find_by(id: params[:product_id])
    end

end
