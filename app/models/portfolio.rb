class Portfolio < ApplicationRecord
 has_many :assignments
 has_many :stocks, through: :assignments
 accepts_nested_attributes_for :stocks
end
