# frozen_string_literal: true

class PodcastPresenter < ApplicationPresenter
  def complete
    object.complete? ? 'yes' : 'no'
  end

  def explicit
    object.explicit? ? 'yes' : 'clean'
  end

  def country_of_origin
    object.target_countries.join(' ')
  end
end
