class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :text, presence: true
  belongs_to :user
  has_many :users,       through: :favorites
  has_many :comments,    dependent: :destroy
  has_many :favorites,   dependent: :destroy
  has_many :tags, through: :tweet_tag_relations
  has_many :tweet_tag_relations, dependent: :destroy
  

  def save_tags(tag_list)
    tag_list.each do |tag|
      unless find_tag = Tag.find_by(tag_name: tag.downcase)
        begin
          self.tags.create!(tag_name: tag)
        rescue
          nil
        end
      else
        TweetTagRelation.create!(tweet_id: self.id, tag_id: find_tag.id)
      end
    end
  end
  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end