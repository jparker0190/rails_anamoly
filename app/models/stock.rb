class Stock < ApplicationRecord
 validates_uniqueness_of :ticker, :case_sensitive => false
 validates :ticker, presence: true
 validates :price, presence: true 
 has_many :assignments
 has_many :portfolios, through: :assignments
end
