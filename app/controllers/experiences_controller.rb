class ExperiencesController < ApplicationController
    include CurrentUserConcern

    def index
        @experiences = Experience.all
        render json: @experiences
    end

    def create 
        @experience = Experience.new(post_params)
        if @experience.save 
            render json: @experience ,statut: :created, location: @experience 
       
        else
            render json: @experience.errors, statut: :unprocessable_entity
        end    
    end   

    def show
        @experience = Experience.find(params[:id])
        render json: @experience
        
    end

    def update
        if @experience.update(post_params)
        render json: @experience

        else
        render json: @experience.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @experience = Experience.find(params[:id])
        @experience.destroy
    end



    private


    def post_params
        params.require(:experience).permit!
    end

    def set_post
        @experience = Experience.find(params[:id])
    end

end
