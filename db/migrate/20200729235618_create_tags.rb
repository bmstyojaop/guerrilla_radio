class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false

      t.timestamps

      t.index :tag_name, unique: true
    end
  end
end
