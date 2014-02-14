class Api::LogsController < ApplicationController

  def logs
    user = User.find(params[:id])
    User.transaction do
      params[:logs].each do |l|
        new_log = Log.new
        new_log.lon = l[1][:lon]
        user.logs << new_log
      end
      user.save!
    end
    render json: ApiMessage.new(200, "Successfully saved logs", nil)
  end
end
