class BottlesController < ApplicationController
  before_action :child
  layout "child"

  def new
    @bottle = child.bottles.build user_id: Current.user
  end

  def create
    @bottle = child.bottles.build(**bottle_params)
    if @bottle.save
      redirect_to child_bottle_path(@child, @bottle), notice: "Bottle was successfully created."
    else
      flash.now[:notice] = @bottle.errors.full_messages.to_sentence
      render :new, status: :unprocessable_content
    end
  end

  def show
    @bottle = child.bottles.find params[:id]
  end

  def index
    start_date = if params[:month].present?
      Date.strptime(params[:month], "%Y-%m")
    else
      Date.current.beginning_of_month
    end
    @bottles = child.bottles.includes(:user)
      .where("started_at >= ? AND started_at < ?", start_date, start_date.end_of_month)
    @bottle_groups = @bottles.group_by { |x| x.started_at.to_date }

    respond_to do |format|
      format.html # For the initial page load
      format.turbo_stream # For Turbo Stream updates
    end
  end

  def edit
    @bottle = child.bottles.find params[:id]
  end

  def update
    @bottle = child.bottles.find params[:id]

    if @bottle.update(**bottle_params)
      redirect_to child_bottle_path(@child, @bottle), notice: "Bottle updated"
    else
      flash.now[:notice] = @bottle.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_content
    end
  end

  private

  def bottle_params
    params.require(:bottle).permit(:amount, :started_at, :ended_at, :user_id, :child_id)
  end

  # TODO: Only permitted users should have access to the child
  def child
    @child ||= Child.find params[:child_id]
  end
end
