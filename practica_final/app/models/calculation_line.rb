class CalculationLine < ActiveRecord::Base
  validates_uniqueness_of :product_id, scope: :calculation_id
  validates :hours, presence: true, numericality: {greater_than: 0, less_than_or_equal: 24}
  validates :amount, presence: true, numericality: {greater_than: 0}

  belongs_to :calculation
  belongs_to :product
end
