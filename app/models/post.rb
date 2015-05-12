class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  acts_as_taggable
  has_attached_file :banner, :styles => { :banner => "1200x300>", :thumb => "100x100>" }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  validates :title, :author, :body, :status, presence: true
  validates :status, inclusion: { in: %w(draft published) }

  scope :drafts,    -> { where(status: "draft") }
  scope :published, -> { where(status: "published") }

  def excerpt
    body.split(" ").slice(0,50).join(" ")
  end

  def post_time
    self.updated_at.strftime("%b %e, %l:%M %p")
  end
end
