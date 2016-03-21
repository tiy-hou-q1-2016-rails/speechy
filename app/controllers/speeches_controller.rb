class SpeechesController < ApplicationController

  before_action do
    if @current_user.blank?
      redirect_to sign_in_path
    else
      redirect_to confirm_pending_path unless @current_user.confirmed?
    end
  end

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

  def share
    @speech = Speech.find_by id: params[:id]

    # Email this email via email to someone's email

    #mailer-name . action . deliver_now
    SpeechesMailer.share(@speech).deliver_now

    redirect_to root_path
  end
end
