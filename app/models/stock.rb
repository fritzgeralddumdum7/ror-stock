class Stock < ApplicationRecord
    has_many :orders
    has_many :wallets
end
