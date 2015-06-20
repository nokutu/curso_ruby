class Calculation < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :post_code, presence: true
end
