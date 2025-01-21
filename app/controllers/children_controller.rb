class ChildrenController < ApplicationController
  def index
    # TODO: scope visible children to user
    @user = Current.user
    @children = Child.all
  end

  def show
    @child = Child.find params[:id]
  end
end
