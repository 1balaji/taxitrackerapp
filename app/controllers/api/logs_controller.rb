class Api::LogsController < ApplicationController

  def logs
    user = User.find(params[:id])
    if !user.nil
      User.transaction do
        params[:logs].each do |l|
          new_log = Log.new
          new_log.lon = l[1][:lon]
          new_log.lat = l[1][:lat]
          new_log.logged_at = l[1][:logged_at]
          new_log.user_id = user.id
          user.logs << new_log
        end
        user.save!
      end

      render json: ApiMessage.new(200, "Successfully saved logs", nil)
    else
      render json: ApiMessage.new(200, "Error in saving logs", nil)
    end
  end
end
