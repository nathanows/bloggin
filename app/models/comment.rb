class Comment < ActiveRecord::Base
  belongs_to :post

  validates :body, :author, presence: true

  def post_time
    self.updated_at.strftime("%b %e, %l:%M %p")
  end
end
