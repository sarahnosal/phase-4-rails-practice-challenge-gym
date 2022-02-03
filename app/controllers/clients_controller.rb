class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def show
        client = Client.find(params[:id])
        render json: client
    end

    def index
        clients = Client.all
        render json: clients
    end

    def update
        client = Client.find(param[:id])
        client.update!(client_params)
        render json: client
    end

    private

    def render_not_found
        render json: {error: "Client not found"}, status: :not_found
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_invalid(invalid)
        render json: {errors: invalid.record.errors}, status: :not_found
    end
end
