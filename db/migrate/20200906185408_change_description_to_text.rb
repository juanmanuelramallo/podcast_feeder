# frozen_string_literal: true

class ChangeDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :podcasts, :description, :text
  end
end
