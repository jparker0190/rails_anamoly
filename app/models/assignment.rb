class Assignment < ApplicationRecord
 validates :description, presence: true
 belongs_to :stock
 belongs_to :portfolio
end
