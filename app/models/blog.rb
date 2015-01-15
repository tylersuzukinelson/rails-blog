class Blog < ActiveRecord::Base

  validates :body, presence: true
  validates :author, presence: true, numericality: true
  validates :vote_count, numericality: true
  validates :view_count, numericality: true
  validate :author_exists

  after_initialize :set_default_counts

  def html_summary
    if body.length > 200
      return "#{body.gsub(/\n/, "<br />")[0..200]}..."
    else
      return "#{body.gsub(/\n/, "<br />")}"
    end
  end

  private

  def author_exists
    errors.add(:author, "does not exist!") unless Author.exists?(author)
  end

  def set_default_counts
    self.vote_count ||= 0
    self.view_count ||= 0
  end

end
