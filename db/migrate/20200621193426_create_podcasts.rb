# frozen_string_literal: true

class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :language, null: false
      t.string :author, null: false
      t.boolean :explicit, null: false, default: false
      t.string :category, null: false
      t.boolean :complete, null: false, default: false
      t.integer :channel_type, null: false
      t.integer :limit
      t.string :target_countries, array: true

      t.timestamps
    end
  end
end
