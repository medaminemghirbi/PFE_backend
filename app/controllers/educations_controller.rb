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
        @education = Education.find(params[:id])
        if @education.update(post_params2)
        render json: @education

        else
        render json: @education.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @education = Education.find(params[:id])
        @education.destroy
    end

    def getusereducation
        
    end 


    private


    def post_params
        params.require(:education).permit!
    end
    def post_params2
        params.permit(:dateDebut ,:dateFin , :ecole ,:freelancer_id)
    end

    def set_post
        @education = Education.find(params[:id])
    end

end
