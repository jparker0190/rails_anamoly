class Stock < ApplicationRecord
 validates :ticker, presence: true, uniqueness: true
 validates :price, presence: true 
 has_many :assignments
 has_many :portfolios, through: :assignments
end
