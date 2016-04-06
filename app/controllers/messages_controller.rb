class MessagesController < ApplicationController

caches_page :index, :new, :create, :destroy 

  def index
    @conversations = current_user.mailbox.conversations
    @notifications = current_user.mailbox.notifications.group_by &:sender_id
    @receipts = current_user.mailbox.receipts
    @message = current_user.mailbox.inbox.first.messages.first.body

  end

# GET /message/new
  def new
    if @user = current_user
  @user = User.find(params[:user])
  @message = current_user.messages.new
    # display form
  else
    respond_to do |format|
   format.html {redirect_to lessons_url, notice: 'You have to sign in or sign up to leave your messages'}
   end
  end
  end

  # POST /message/create
  def create
    @recipient = User.find(params[:user])
    current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end

  def destroy
    @message = current_user.mailbox.inbox.first.messages.first.body
    @message.destroy
    redirect_to conversations_path
  end

end
