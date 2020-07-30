class CreateTweetTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_tag_relations do |t|
      t.reference :tweet
      t.reference :tag

      t.timestamps
    end
  end
end
