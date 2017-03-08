class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id]) #WHAT IS THIS?
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    
    @advertisement = Advertisement.new

    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]
    
    if @advertisement.save
      flash[:notice] = "advertisement saved"
      redirect_to @advertisement
    else 
      flash[:alert] = "There was an error, please try again"
      render :new
    end
  end
  
end
