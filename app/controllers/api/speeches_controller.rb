class Api::SpeechesController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @speeches = Speech.all
  end

  def show
    @speech = Speech.find_by id: params[:id]
  end

  def create
    @speech = Speech.new params.require(:speech).permit(:author, :title, :content)
    if @speech.save
      render :show
    else
      render json: @speech.errors, status: 422
    end
  end
end
