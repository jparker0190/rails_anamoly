class Stock < ApplicationRecord
 before_save :capitalize_ticker
 validates_uniqueness_of :ticker, :case_sensitive => false
 validates :ticker, presence: true
 validates :price, presence: true 
 has_many :assignments
 has_many :portfolios, through: :assignments

 def self.alphabatize
  @stocks = Stock.order('ticker ASC')
 end
 def capitalize_ticker
 self.ticker =  self.ticker.upcase
 end

end
