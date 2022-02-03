class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :charge, :client_id, :gym_id

  belongs_to :gym
  belongs_to :client
end
