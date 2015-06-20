class Calculation < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :post_code, presence: true

  has_many :calculation_lines
end
