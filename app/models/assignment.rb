class Assignment < ApplicationRecord
 validates :description, presence: true
 belongs_to :stock
 belongs_to :portfolio
 def self.alphabatize
  @stocks = Stock.order('ticker ASC')
 end
end
