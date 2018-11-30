class Portfolio < ApplicationRecord
 validates :name, presence: true
 belongs_to :user
 has_many :assignments
 has_many :stocks, through: :assignments
 accepts_nested_attributes_for :stocks
end
