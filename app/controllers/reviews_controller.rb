class ReviewsController < ApplicationController
    include CurrentUserConcern
    def index
        @reviews = Review.all
        render json: @reviews
    end

    def create 
        @review = Review.new(post_params)
        if @review.save 
            render json: @review ,statut: :created, location: @review 
       
        else
            render json: @review.errors, statut: :unprocessable_entity
        end    
    end   

    def show
        @review = Review.find(params[:id])
        render json: @review
        
    end

    def update
        if @review.update(post_params)
        render json: @review

        else
        render json: @review.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
    end



    private


    def post_params
        params.require(:review).permit!
    end

    def set_post
        @review = Review.find(params[:id])
    end

end
