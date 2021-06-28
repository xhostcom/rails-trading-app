class ConversationsController < ApplicationController
  before_authenticate :authenticate_user!

  def index
   @users = User.all
   @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
    @conversation = Conversation.between(params[:sender_id], params[:recipient]).first
  else
    @conversation = Conversation.create!(conversation_params) 
  end

  redirect_to conversation_message_path(@conversation)
end