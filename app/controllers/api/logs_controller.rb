class Api::LogsController < ApplicationController

  def logs
    render json: ApiMessage.new(200, "Successfully saved logs", nil)
  end
end
