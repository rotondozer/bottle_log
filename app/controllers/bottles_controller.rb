class BottlesController < ApplicationController
  def new
    @bottle = Current.user.bottles.build
  end

  def create
    @bottle = Current.user.bottles.build(**bottle_params)
    if @bottle.save
      redirect_to @bottle, notice: "Bottle was successfully created."
    else
      flash.now[:notice] = @bottle.errors.full_messages.to_sentence
      render :new, status: :unprocessable_content
    end
  end

  def show
    @bottle = Bottle.find(params[:id])
  end

  def index
    # TODO: filter entries based on a month param
    entries = Bottle.where("started_at >= ? AND started_at < ?", Date.current.beginning_of_month, Date.current.end_of_month)
    @bottles = entries.group_by { |x| x.started_at.to_date }
  end

  def edit
    @bottle = Bottle.find(params[:id])
  end

  def update
    @bottle = Bottle.find(params[:id])

    if @bottle.update(**bottle_params)
      redirect_to @bottle, notice: "Bottle updated"
    else
      flash.now[:notice] = @bottle.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_content
    end
  end

  private

  def bottle_params
    params.require(:bottle).permit(:amount, :started_at, :ended_at, :user_id)
  end
end
