class Api::SpeechesController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    search_text = params[:search]
    @speeches = Speech.all
    if search_text.present?
      @speeches = @speeches.search_all(params[:search])
    end
  end

  def authors
    render json: {authors: Speech.pluck(:author).uniq.sort }
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
