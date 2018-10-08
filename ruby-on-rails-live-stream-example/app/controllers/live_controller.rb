class LiveController < ApplicationController
  include ActionController::Live
  def index
    response.headers['Content-Type'] = 'text/event-stream'
    1000.times {
      response.stream.write "Hello Live\n"
      sleep 1
    }
  ensure
    response.stream.close
  end
end
