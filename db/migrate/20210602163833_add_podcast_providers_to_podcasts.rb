class AddPodcastProvidersToPodcasts < ActiveRecord::Migration[6.0]
  def change
    change_table :podcasts do |t|
      t.string :apple_podcasts_url, default: '', null: false
      t.string :google_podcasts_url, default: '', null: false
      t.string :spotify_url, default: '', null: false
    end
  end
end
