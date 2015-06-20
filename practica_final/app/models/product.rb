class Product < ActiveRecord::Base
  has_many :calculation_lines
end
