class BottlesController < ApplicationController
  def new
  end

  def show
  end

  def index
    @bottles = Bottle.all
  end
end
