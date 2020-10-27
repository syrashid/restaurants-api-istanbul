class Api::V1::RestaurantsController < Api::V1::BaseController
  # Same as before_action authenticate_user! but for an api with a token

  # HTTP Requests You Should Know
  # 2XX Ok, Good Job, Success
  # 3XX Redirects
  # 4XX You fucked up
  # 5XX We fucked up

  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_restaurant, except: [ :index, :create ]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show; end

  def update
    if @restaurant.update(restaurant_params)
      render :show
    else
      render_error
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
