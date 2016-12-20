class ClientsController < ApplicationController
    before_action :find_client, only: [:show, :edit, :update, :destroy] 
    
    def index
        @clients =Client.all.order("last_name ASC")
    end
    
    def show
    end    


    def new
      @client = Client.new
    end
    
    def create
      @client = Client.new(client_params) 
        if @client.save 
            redirect_to root_path
        else
            render "new"
        end    
    end
    
    def edit
    end

    def update
    	if @client.update(client_params)
	        redirect_to client_path
	    else
	        render "edit"
        end         
    end

    def destroy
        @client.destroy
	    redirect_to root_path
    end
    
    
    private
    
    def client_params 
      params.require(:client).permit(:first_name, :last_name, :last_four)
    end
    
    def find_client
        @client = Client.find(params[:id])
    end
    
end
