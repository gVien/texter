class TextsController < ApplicationController
  def new
    @text = Text.new
  end

  def create
    @text = Text.new(params[:text])
    if @text.valid?
      HTTParty.post("http://textbelt.com/text", { body: { number: params[:text][:phone_number], message: params[:text][:message]} })
      flash[:success] = "Text has successfully sent to #{params[:text][:phone_number]}"
      redirect_to root_path
    else
      render "new"
    end
  end

  private

    # def text_params
    #   params.permit(:text).permit(:phone_number, :message)
    # end
end
