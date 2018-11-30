class Portfolio < ApplicationRecord
 validates :name, presence: true
 validates_uniqueness_of :name, :case_sensitive => false
 belongs_to :user
 has_many :assignments
 has_many :stocks, through: :assignments
 accepts_nested_attributes_for :stocks
end
