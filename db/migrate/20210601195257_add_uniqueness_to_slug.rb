# frozen_string_literal: true

class AddUniquenessToSlug < ActiveRecord::Migration[6.0]
  def change
    add_index :podcasts, :slug, unique: true
  end
end
