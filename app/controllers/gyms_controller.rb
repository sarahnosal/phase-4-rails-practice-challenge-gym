class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def show
        gym = Gym.find(params[:id])
        render json: gym, :except => [:created_at, :updated_at]
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    def index
        gyms = Gym.all
        render json: gyms
    end

    def update
        gym = Gym.find(param[:id])
        gym.update!(gym_params)
        render json: gym
    end

    private

    def render_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end

    def gym_params
        params.permit(:name, :address)
    end

    def render_invalid(invalid)
        render json: {errors: invalid.record.errors}, status: :not_found
    end
end
