class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    # def sum
    #     charges = self.memberships.pluck(:charge)
    #     charges.sum()
    # end
end
