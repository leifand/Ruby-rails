class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      flash[:notice] = ["U tuk are jerbs!"]
      return redirect_to '/messages'
    end
    flash[:errors] = @message.errors.full_messages
    return redirect_to :back
  end
  private def message_params
    params.require(:message).permit(:context)
  end
end
