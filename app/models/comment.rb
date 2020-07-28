class Comment < ApplicationRecord
  belongs_to :user
  berongs_to :tweet
end
