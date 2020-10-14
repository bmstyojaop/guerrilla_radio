class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
  # def already_liked?(tweet)
  #   self.likes.exists?(tweet_id: tweet.id)
  # end
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = 'ゲストさん'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
