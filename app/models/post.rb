class Post < ActiveRecord::Base
  validates :title, :author, :body, :status, presence: true
  validates :status, inclusion: { in: %w(draft published) }

  def excerpt
    body.split(' ').slice(0,50).join(' ')
  end
end
