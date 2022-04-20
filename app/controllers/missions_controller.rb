class MissionsController < ApplicationController
    include CurrentUserConcern
   

    def index
        @missions = Mission.all
        render json: @missions  , include: [  :category , :mission_languages , :languages , :client  ]
    end

    def create 
        
        @mission = Mission.new(post_params)
          ids=[]
        if @mission.save 
            
            params[:language_id].split(",").each do |lang_id|
               ids.push(lang_id.to_i) 
                @missionLanguages =MissionLanguage.create!( language_id: lang_id.to_i ,mission_id: @mission.id)
              end

            @missionlanguages = MissionLanguage.where(language_id: ids , mission_id: @mission.id )
  
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

    def getmissionbylanguage 
        @missions = MissionLanguage.where(language_id: params[:language_id])
        render json: @missions , include: [  :mission , :language ]
    end

    def getmissionbycategory 
        @missions = Mission.where(category_id: params[:category_id])
        render json: @missions , include: [  :category , :mission_languages , :languages , :client]
    end

    def getmissionbybudget     
        @missions = Mission.where("budget <= ?" ,  params[:budget]).order('budget DESC')  
        render json: @missions , include: [  :category , :mission_languages , :languages , :client]
    end
    def getendedmissionbyclient 
        ids = []
        @mission = Mission.where(client_id:  params[:client_id] )
        @status = Mission.where("completed = ?" , status = true )
        render json:  @status  , include: [ :freelancer ]   
    end

    def getendedmissionbyfreelancer 
        ids = []
        @mission = Mission.where(freelancer_id:  params[:freelancer_id] )
        @status = Mission.where("completed = ?" , status = true )
        render json:  @status  , include: [ :freelancer ]   
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
