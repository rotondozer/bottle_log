class BottlesController < ApplicationController
  def new
    @bottle = Current.user.bottles.build
  end

  def create
    @bottle = Current.user.bottles.build(bottle_params)
    if @bottle.save
      redirect_to @bottle, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
    @bottle = Bottle.find(params[:id])
  end

  def index
    @bottles = Bottle.all
  end

  private

  def bottle_params
    params.require(:bottle).permit(:amount, :started_at, :ended_at, :user_id)
  end
end
