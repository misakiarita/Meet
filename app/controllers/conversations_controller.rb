class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #current_userのConversationだけにする
    rooms = Member.where(user_id: current_user).pluck(:conversation_id)
    @conversations = Conversation.where(id: rooms)
  end

  def create
    conversation = current_user.conversations.create(pet_id: params[:pet_id])
    @member = params[:member_ids]
    @member.each do |m|
      member = conversation.members.create!(user_id: m)
    end
    redirect_to conversations_path
  end
end
