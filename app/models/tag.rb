class Tag < ApplicationRecord
  before_save :downcase_tag_name

  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tweets, through: :tweet_tag_relations

  validates :tag_name, presence: true, uniqueness: true, length: { maximum: 50 }


  def self.search(search)
    if search
      Tag.where('text LIKE(?)', "%#{search}%")
    else
      Tag.all
    end
  end
  private

  # タグ名を小文字に変換
  def downcase_tag_name
    self.tag_name.downcase!
  end
end
