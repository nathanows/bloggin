class Post < ActiveRecord::Base
  validates :title, :author, :body, :status, presence: true
  validates :status, inclusion: { in: %w(draft published) }
end
