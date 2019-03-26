class ReviewsController < ApplicationController
   
    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        @review.product_id = params['product_id']

        if @review.save 
            redirect_to :back
        else 
            puts "CREATING A REVIEW NOT WORKING"
            puts @review.errors.messages
        end 
            
    end 

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to :back
      end
    
    private

    def review_params
      params.require(:review).permit(
        :rating,
        :description
      )
    end
end
