class GraphsController < ApplicationController

  @@by_day = File.read("db/by_days.json")
  @@by_user = File.read("db/by_users.json")

  def index

  end

  # Queries the 'by_users' table and sends data to front end.
  def by_user
    respond_to do |format|
      format.html { render 'by_user' }
      format.js { render 'by_user'}
      format.json { render json: @@by_user }
    end
  end

  # Queries the 'by_days' table and sends data to front end.
  def by_day
    respond_to do |format|
      format.html { render 'by_day'}
      format.js { render 'by_day'}
      format.json { render json: @@by_day }
    end
  end

end
