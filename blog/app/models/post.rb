class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  validates :title, presence: {message: 'no puede estar en blanco'}
  validates :body, presence: {message: 'no puede estar en blanco'}
  validates :author_id, presence: {message: 'no puede estar en blanco'}

  PER_PAGE = 3
end
