class Petition < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :lend_start_date, presence: true
  validates :description, presence: true
end
