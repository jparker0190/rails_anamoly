class Stock < ApplicationRecord
 has_many :assignments
 has_many :portfolios, through: :assignments
end
