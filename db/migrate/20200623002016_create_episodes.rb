# frozen_string_literal: true

class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :episodes do |t|
      t.uuid :guid, null: false, default: 'gen_random_uuid()'
      t.datetime :pub_date, null: false
      t.string :title, null: false, default: ''
      t.string :description, null: false, default: ''
      t.boolean :explicit, null: false, default: false
      t.string :keywords, null: false, default: ''
      t.belongs_to :podcast, foreign_key: true

      t.timestamps
    end
  end
end
