class CreateMusicians < ActiveRecord::Migration[7.0]
  def change
    create_table :musicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :location
      t.text :description
      t.string :type_of_event
      t.string :type_of_musician
      t.string :youtube_link
      t.string :instagram_link
      t.string :soundcloud_link
      t.string :spotify_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
