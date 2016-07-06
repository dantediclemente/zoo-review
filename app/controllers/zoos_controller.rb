class ZoosController < ApplicationController
  def index
    @zoos = Zoos.all
  end

  def show
    @zoo = Zoos.find(params[:id])
  end

  def new
    @zoo = Zoos.new
  end
end
