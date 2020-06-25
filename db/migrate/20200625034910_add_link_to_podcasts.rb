# frozen_string_literal: true

class AddLinkToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :link, :string
  end
end
