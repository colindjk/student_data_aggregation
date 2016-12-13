class GraphsController < ApplicationController

  #respond_to :json

  # This will be form for trying to make queries.
  def index

  end

  # TODO: Modify serialization so it can happen in a predefined method in the
  # model, and not be modified on the front-end.

  # Queries the 'by_users' table and sends data to front end.
  def by_user
    gon.data = ByUser.for_each_book("4").sum(:attempts).to_json # queries the ByUser model's table.
  end

  # Queries the 'by_days' table and sends data to front end.
  def by_day
    gon.data = ByDay.for_each_book("4").sum(:attempts).to_json # queries the ByDay model's table.
  end

  # Organize by task / assignment. Get grades for users (students) based on
  # averages / outliers.
  def by_task

  end

end
