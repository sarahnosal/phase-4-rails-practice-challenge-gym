class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :sum

  has_many :memberships
  has_many :gyms

  def sum
    charges = object.memberships.pluck(:charge)
    charges.sum()
  end
end
