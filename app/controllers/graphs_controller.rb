class GraphsController < ApplicationController

  #respond_to :json

  def index

  end

  # TODO: Form for specification of database tables.

  # Queries the 'by_users' table and sends data to front end.
  def by_user
    gon.data = ByUser.all.to_json # queries the ByUser model's table.
  end

  # Queries the 'by_days' table and sends data to front end.
  def by_day
    gon.data = ByDay.all.to_json # queries the ByDay model's table.
  end

  # Organize by task / assignment. Get grades for users (students) based on
  # averages / outliers.
  def by_task

  end

end
