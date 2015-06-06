class Comment < ActiveRecord::Base
  has_many :replies, class_name: 'Comment',
                     foreign_key: 'reply_to_id'

  belongs_to :reply_to, class_name: 'Comment'
  belongs_to :post, touch: true
  belongs_to :author

  validates :content, presence: {message: 'no puede estar en blanco'}
  validates :author_id, presence: {message: 'no puede estar en blanco'}
  validates :post_id, presence: {message: 'no puede estar en blanco'}

  def print(indent = 0)
    ret = [[indent, self]]
    unless replies.nil?
      self.replies.order(:created_at).each do |r|
        r.print(indent + 1).each do |s|
          ret += [[s[0], s[1], s[2]]]
        end
      end
    end
    ret
  end
end
