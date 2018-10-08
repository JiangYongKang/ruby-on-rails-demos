class SessionsController < ApplicationController
  def index
  end

  def update
    session[:random_id] = SecureRandom.hex(16)
    redirect_to action: :index
  end

  def destroy
    session[:random_id] = nil
    redirect_to action: :index
  end
end
