class Comment < ActiveRecord::Base

  validates :author, presence: true
  validates :email, presence: true, format: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/
  validates :body, presence: true
  validates :nested, inclusion: { in: [true, false] }
  validates :parent, presence: true
  validate :parent_exists

  private

  def parent_exists
    if nested
      errors.add(:parent, "does not exist!") unless Comment.exists?(parent)
    else
      errors.add(:parent, "does not exist!") unless Blog.exists?(parent)
    end
  end

end
