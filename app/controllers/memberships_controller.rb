class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    def index
        memberships = Membership.all
        render json: memberships
    end

    private 

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def render_invalid(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
end
