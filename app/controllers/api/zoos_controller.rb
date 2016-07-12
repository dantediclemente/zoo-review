class Api::ZoosController < ApiController
  def index
    zoos = Zoo.all
    render json: { zoos: zoos }, status: :ok
  end
end
