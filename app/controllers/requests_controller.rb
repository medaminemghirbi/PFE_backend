class RequestsController < ApplicationController

    include CurrentUserConcern
   

    def index
        @requests = Request.all
        render json: @requests  , include: [  :mission , :freelancer ]
    end 
##################################################################################################
    def getrequestbyfreelancer  
        @requests = Request.where(freelancer_id: params[:freelancer_id])
        render json: @requests , include: [  :mission , :freelancer ]
    end
######################################################################################################
    def getrequestbyclient
        ids = []
        @mission = Mission.where(client_id:  params[:client_id] )
        @request = Request.where(mission_id: @mission.ids )
        render json:  @request    , include: [:mission , :freelancer ]
        
    end
######################################################################################################

    def getrequestacceptedbyclient
        ids = []
        @mission = Mission.where(client_id:  params[:client_id] )
        
        @request = Request.where(mission_id: @mission.ids  ).where("status = ?" , status = 1 )

        render json:  @request     , include: [:mission , :freelancer ]
    end

    def getrequestacceptedbyfreelancer
        ids = []
        @mission = Mission.where(freelancer_id:  params[:freelancer_id] )
        
        @request = Request.where(mission_id: @mission.ids  ).where("status = ?" , status = 1 ).where(freelancer_id:  params[:freelancer_id] )

        render json:  @request   , include: [:mission , :freelancer]   
    end

###################################################################################################
    def create       
        @request = Request.new(post_params)
        if @request.save 
            render json:  { 
                request: @request,

                },statut: :created, location: @request 
       
        else
            render json: @request.errors, statut: :unprocessable_entity
        end    
    end   
######################################################################################################""
    def show
        @request = Request.find(params[:id])
        render json: @request
        
    end
##################################################
    def update
        @request = Request.find(params[:id])  
        if @request.update(post_params2)
            @requestfreelancer = Mission.where("id = ?" ,  @request.mission_id ).update(freelancer_id: @request.freelancer_id)

            render json: 
            {
                request:  @request ,
                requestfreelancer: @requestfreelancer ,
            }

        else
        render json: @request.errors, statut: :unprocessable_entity
        end
    end
###################################################################################################
    def updatecompleted 
        @request = Request.find(params[:id])  
    @requestfreelancer = Mission.where("id = ?" ,  @request.mission_id ).where(freelancer_id: @request.freelancer_id)
    if @requestfreelancer.update(post_params3) 
        render json:   @requestfreelancer , include: [:freelancer , :category]

    else
    render json: @requestfreelancer.errors, statut: :unprocessable_entity
    end
    end
####################################################################################################

    def destroy
        @request = Request.find(params[:id])
        @request.destroy
    end
########################################################################################################
    def countproposition  
        @mission = Request.where(mission_id: params[:mission_id]).count
        render json: @mission
    end

    private

    def post_params
        params.permit( :mission_id , :freelancer_id )
        
    end

    def post_params2
        # lazm tbaath kol shy fl update 
        params.permit(:status ,:mission_id , :freelancer_id )
    end

    def post_params3
        # lazm tbaath kol shy fl update 
        params.permit(:completed , :filepath )
    end

    def set_post
        @request = Request.find(params[:id])
    end

end
