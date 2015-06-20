class CalculationLine < ActiveRecord::Base
  validates_uniqueness_of :product_id, scope: :calculation_id
  validates :hours, presence: true
  validates :amount, presence: true

  belongs_to :calculation
  belongs_to :product
end
