class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :post
  has_many :comment_votes

  def self.sort
    order(created_at: :desc)
  end

  def days_ago
    days = (Date.today - created_at.to_date).to_i
    days == 0 ? "Today" : "#{days} Days Ago"
  end

  def up_votes
    comment_votes.where(vote: true).count
  end

  def down_votes
    comment_votes.where(vote: false).count
  end
end
