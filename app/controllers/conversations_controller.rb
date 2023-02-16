class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #curren_userのConversationだけにする
    @conversations = Conversation.all
  end

  def create
    conversation = current_user.conversations.create(pet_id: params[:pet_id])
    @member = params[:member_ids]
    @member.each do |m|
      member = conversation.members.create!(user_id: m)
    end
    redirect_to conversations_path, notice: "投稿者に連絡してみましょう！"
  end
end
