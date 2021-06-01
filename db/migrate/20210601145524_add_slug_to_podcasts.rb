# frozen_string_literal: true

class AddSlugToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :slug, :string, null: false, default: ''
  end
end
