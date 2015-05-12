class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, :author, :body, :status, presence: true
  validates :status, inclusion: { in: %w(draft published) }

  scope :drafts,    -> { where(status: "draft") }
  scope :published, -> { where(status: "published") }

  def excerpt
    body.split(" ").slice(0,50).join(" ")
  end
end
