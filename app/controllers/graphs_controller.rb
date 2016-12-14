class GraphsController < ApplicationController

  #respond_to :json

  # This will be form for trying to make queries.
  # TODO: Add a form here for filling our stuff.
  def index
    @book_ids = ['4', '5', '6', '7', '8', '10', '11', '16', '18', '20', '24', '26', '29', '32']
    @data_types = ['attempts', 'correct', 'credited', 'interactions']
    @book = params[:book]
    @column = params[:data]
  end

  def create
    @book = params[:book_id]
    @type = params[:type]
    @comp = params[:compare_to]
    gon.data_name   = "#{@type} (y) per User (x)"
    gon.comp_name   = "Correlation between #{@type} (black), #{@comp} (green)"
    gon.data = ByUser.for_each_book(@book).sum(@type).to_json # queries the ByUser model's table.
    gon.comp = ByUser.for_each_book(@book).sum(@comp).to_json
  end

  # TODO: Modify serialization so it can happen in a predefined method in the
  # model, and not be modified on the front-end.

  # Queries the 'by_users' table and sends data to front end.
  def by_user
    gon.data_name = "Interactions (y) per User (x)"
    gon.comp_name = "Correlation between interactions (black), attempts (red), and correct (green)"
    gon.data = ByUser.for_each_book("4").sum(:interactions).to_json # queries the ByUser model's table.
    gon.comp = ByUser.for_each_book("4").sum(:attempts).to_json
    gon.comp_alt = ByUser.for_each_book("4").sum(:correct).to_json
  end

  # Queries the 'by_days' table and sends data to front end.
  def by_day
    gon.data_name = "Attempts (y) per User (x)"
    gon.data = ByDay.for_each_book("4").sum(:attempts).to_json # queries the ByDay model's table.
  end

  # Organize by task / assignment. Get grades for users (students) based on
  # averages / outliers.
  def by_task

  end

end
