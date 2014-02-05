class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  belongs_to :user

  def self.sort
    order(created_at: :desc)
  end

  def days_ago
    days = (Date.today - created_at.to_date).to_i
    days == 0 ? "Today" : "#{days} Days Ago"
  end
end
