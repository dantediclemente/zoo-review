class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new(zoo_params)

    if @zoo.save
      flash[:notice]="Zoo added successfully"
      redirect_to zoo_path(@zoo)
    else
      flash[:errors] = @zoo.errors.full_messages.join(",")
      render :new
    end
  end

  private
  def zoo_params
      params.require(:zoo).permit(
      :name,
      :address,
      :city,
      :state,
      :zip
      )
    end

end
