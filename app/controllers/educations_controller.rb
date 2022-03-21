class EducationsController < ApplicationController
    include CurrentUserConcern

    def index
        @educations = Education.all
        render json: @educations
    end

    def create 
        @education = Education.new(post_params)
        if @education.save 
            render json: @education ,statut: :created, location: @education 
       
        else
            render json: @education.errors, statut: :unprocessable_entity
        end    
    end   

    def show
        @education = Education.find(params[:id])
        render json: @education
        
    end

    def update
        if @education.update(post_params)
        render json: @education

        else
        render json: @education.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @education = Education.find(params[:id])
        @education.destroy
    end



    private


    def post_params
        params.require(:education).permit!
    end

    def set_post
        @education = Education.find(params[:id])
    end

end
