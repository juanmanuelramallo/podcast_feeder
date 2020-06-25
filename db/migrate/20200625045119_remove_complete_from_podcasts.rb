# frozen_string_literal: true

class RemoveCompleteFromPodcasts < ActiveRecord::Migration[6.0]
  def change
    remove_column :podcasts, :complete, :boolean, default: false, null: false
  end
end
