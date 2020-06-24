# frozen_string_literal: true

class AddEmailToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :email, :string, null: false, default: ''
  end
end
