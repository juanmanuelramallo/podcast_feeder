# frozen_string_literal: true

class PodcastPresenter < ApplicationPresenter
  def explicit
    object.explicit? ? 'Yes' : 'No'
  end

  def country_of_origin
    object.target_countries.join(' ')
  end
end
