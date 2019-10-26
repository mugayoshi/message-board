class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    @messages = Message.all.page(params[:page]).per(10)
  end
  
  def show
    
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = 'Message is posted'
      redirect_to @message
    else
      flash.now[:danger] = 'Message is not posted'
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = 'Message is posted'
      redirect_to @message
    else
      flash.now[:danger] = 'Message is not posted'
      render :edit
    end
  end
  
  def destroy
    @message.destroy
    
    flash[:success] = 'Message is deleted successfully'
    redirect_to messages_url
  end
  
  
  private
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params
    params.require(:message).permit(:content, :title)
  end
end
