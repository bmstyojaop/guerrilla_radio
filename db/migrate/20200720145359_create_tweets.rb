class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.text :image, null: false
      t.integer :likes_count

      t.timestamps
    end
  end
end 
