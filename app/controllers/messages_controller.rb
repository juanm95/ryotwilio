class MessagesController < ApplicationController
	require 'rubygems' # not necessary with ruby 1.9 but included for completeness
	require 'twilio-ruby'

	@@account_sid = 'AC8b02c87ccb73a64fc9a3dd588571c195'
	@@auth_token = '826d85e519167ee18af6c7ab0dc86fba'
	@@client = Twilio::REST::Client.new @@account_sid, @@auth_token
  def create
  	@message = Message.new
  end

  def send_message
  	@message = Message.new(send_params(params[:message]))
  	begin
			@message = @@client.account.messages.create(:body => @message[:body], :to => @message[:to], :from => '+13235270659')
		rescue Twilio::REST::RequestError => e
			flash.now.alert = "Message could not be sent."
			render "create"
			return
		end
		@message.from = '+13235270659'
		@message.save
		flash.notice = "Message sent!"
		redirect_to(:action => :create)
  end

  private
  def send_params(params)
  	return params.permit(:to, :body)
  end
end
