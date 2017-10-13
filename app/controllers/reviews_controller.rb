class ReviewsController < ApplicationController

    before_filter :authorize

    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)

        if @review.save
            redirect_to @product, notice: 'Review has been submitted!'
        else
            redirect_to @product, notice: "Errors"
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @review = Review.find_by(@product.id)
        @review.destroy!
        redirect_to @product
    end

    private
    def review_params
        params.require(:review).permit(:description, :rating).merge(user: current_user)
    end

end
