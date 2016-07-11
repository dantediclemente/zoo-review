class ZoosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_filter :authorize_user, only: [:destroy]

  def index
    @zoos = Zoo.all
  end

  def show
    @zoo = Zoo.find(params[:id])
    @review = Review.new
    @rating_collection = Review::RATING
    @reviews = @zoo.reviews
  end

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new(zoo_params)
    @zoo.user_id = current_user.id

    if @zoo.save
      flash[:notice] = "Zoo added successfully"
      redirect_to zoo_path(@zoo)
    else
      flash[:errors] = @zoo.errors.full_messages.join(",")
      render :new
    end
  end

  def search
    @results = Zoo.where("name ILIKE ?", "%#{params[:q]}%")
    render :search
  end

  def edit
    @zoo = Zoo.find(params[:id])
  end

  def update
    @zoo = Zoo.find(params[:id])
    if @zoo.update_attributes(zoo_params)
      flash[:notice] = "Zoo updated successfully"
      redirect_to zoo_path(@zoo)
    else
      flash[:errors] = @zoo.errors.full_messages.join(",")
      render :edit
    end
  end

  def destroy
    @zoo = Zoo.find(params[:id])
    @zoo.destroy
    flash[:notice] = "Zoo deleted successfully"
    redirect_to zoos_path
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

  def authorize_user
    @zoo = Zoo.find(params[:id])
    if !current_user.admin? && current_user.id != @zoo.user_id
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
