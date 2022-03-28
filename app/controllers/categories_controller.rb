class CategoriesController < ApplicationController
    include CurrentUserConcern
    # //////////////////////////////////  categories 

    def index
        
        @categories = Category.all    #Change here
        render json: @categories
    end

    def create 
       
            @category = Category.new(post_params)
            if @category.save 
                render json: @category   ,statut: :created, location: @category 
        
            else
                render json: @category.errors, statut: :unprocessable_entity
            end
        
    end   

    def show
        @category = Category.find(params[:id])
        render json: @category
        
    end

    def update
        
            @category = Category.find(params[:id])
            if @category.update(post_params2)
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
    
    def post_params2
        # lazm tbaath kol shy fl update 
        params.permit(:name , :avatar)
    end

    #def post_params
    #    params.permit(:name, :image)
    #end

    def set_post
        @category = Category.find(params[:id])
    end

end
