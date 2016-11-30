class GraphsController < ApplicationController

  def index
    @graphs = Graph.all
  end

  def show

  end
end
