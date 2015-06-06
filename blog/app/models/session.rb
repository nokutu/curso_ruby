class Session < ActiveRecord::Base
  belongs_to :author

  validates :cookie, uniqueness: true
end
