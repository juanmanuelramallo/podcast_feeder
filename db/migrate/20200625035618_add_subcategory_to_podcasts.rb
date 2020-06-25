# frozen_string_literal: true

class AddSubcategoryToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :subcategory, :string
  end
end
