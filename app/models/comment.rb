class Comment < ActiveRecord::Base
  belongs_to :post

  validates :body, :author, presence: true
end
