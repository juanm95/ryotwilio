class AdminController < ApplicationController
  def index
  	@messages = Message.all
  end
end
