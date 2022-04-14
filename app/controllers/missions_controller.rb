class MissionsController < ApplicationController
    include CurrentUserConcern
   

    def index
        @missions = Mission.all
        render json: @missions  , include: [  :category , :mission_languages , :languages ]
    end

    def create 
        
        @mission = Mission.new(post_params)
          
        if @mission.save 
            
            params[:language_id].pluck(:id).each do |lang_id|
                @missionLanguages =MissionLanguage.create!( language_id: lang_id ,mission_id: @mission.id)
              end
            @missionlanguages = MissionLanguage.where(language_id: params[:language_id].pluck(:id) , mission_id: @mission.id )
  
            render json:  { 
                mission: @mission,
                missionlanguages: @missionlanguages },statut: :created, location: @mission 
       
        else
            render json: @mission.errors, statut: :unprocessable_entity
        end    
    end   

    def show
        @mission = Mission.find(params[:id])
        render json: @mission
        
    end

    def update
        @mission = Mission.find(params[:id])
        if @mission.update(post_params2)
        render json: @mission

        else
        render json: @mission.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @mission = Mission.find(params[:id])
        @mission.destroy
    end



    private

    def post_params
        params.permit(:title, :description, :duration, :beginingDate,:budget , :client_id,:category_id , :mission_languages =>[:language_id] )
        
    end

    def post_params2
        # lazm tbaath kol shy fl update 
        params.permit(:title, :description, :duration, :beginingDate,:client_id,:freelancer_id )
    end

    def set_post
        @mission = Mission.find(params[:id])
    end

end
