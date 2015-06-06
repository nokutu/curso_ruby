class Author < ActiveRecord::Base
  has_many :posts
  has_one :session
  has_many :comments

  validates :email, format: { with: /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})/, message: 'no válido' }
  validates :name, presence: {message: 'no puede estar en blanco'}
  validates :surname, presence: {message: 'no puede estar en blanco'}
  validates :nickname, presence: {message: 'no puede estar en blanco'}
  validates :password, presence: {message: 'no puede estar en blanco'}, on: :create
  validates :nickname, uniqueness: {message: 'ya está en uso', case_sensitive: false}

  PER_PAGE = 15
end
