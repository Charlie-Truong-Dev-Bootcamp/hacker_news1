class User < ActiveRecord::Base
  include BCrypt
  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :comment_votes
  def password
      @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    @user = User.new(username: params[:username], email: params[:email])
    @user.password = params[:password]
    @user.save
    @user
  end

  def self.authenticate(params)
    @user = User.find_by(username: params[:username])
    if @user.password == params[:password]
      @user
    else
      nil
    end
  end

  def days_ago
    days = (Date.today - created_at.to_date).to_i
    days == 0 ? "Today" : "#{days} Days Ago"
  end
end
