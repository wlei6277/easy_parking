class AreasController < ApplicationController
    def index
        #pull all the region data from the database and put it into an array
        @data = []
        for record in Area.all
            @data.push([record[:lat],record[:lng],record[:spaces],record[:location]])
        end
        gon.data = @data
    end

    def show
        
    end
    
    def new
        @area = Area.new
    end

    def create
        Area.import(params[:area][:file], params[:area]["name"]) 
        flash[:notice] = "Area uploaded successfully"
        redirect_to areas_path
    end

end
