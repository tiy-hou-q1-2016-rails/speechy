class SpeechesController < ApplicationController

  def index
    search_text = params[:search]
    @speeches = Speech.all
    if search_text.present?
      # @speeches = @speeches.where("title ILIKE ?", "%#{search_text}%")
      @speeches = @speeches.search_all(params[:search])
    end
  end

  def show
    @speech = Speech.find_by id: params[:id]
  end
end
