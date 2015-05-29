class AdvertisementsController < ApplicationController
  def index
    @advertisement = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end
end
