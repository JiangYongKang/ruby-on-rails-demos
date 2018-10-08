class CookiesController < ApplicationController
  def index
    cookies[:random_id] = SecureRandom.hex(16)
  end
end
