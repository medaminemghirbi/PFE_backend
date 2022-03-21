class CategoriesController < ApplicationController
    include CurrentUserConcern
    # //////////////////////////////////  categories 

    def index
        @categories = Category.all    #Change here
        render json: @categories
    end

    def create 
        if @current_user.role == "admin"
            @category = Category.new(post_params)
            if @category.save 
                render json: @category   ,statut: :created, location: @category 
        
            else
                render json: @category.errors, statut: :unprocessable_entity
            end
        else
            render :json => 'you are not an admin'
          end   
    end   

    def show
        @category = Category.find(params[:id])
        render json: @category
        
    end

    def update
        if @category.update(post_params)
        render json: @category

        else
        render json: @category.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
    end



    private

    def post_params
        params.require(:category).permit!
    end

    #def post_params
    #    params.permit(:name, :image)
    #end

    def set_post
        @category = Category.find(params[:id])
    end

end
