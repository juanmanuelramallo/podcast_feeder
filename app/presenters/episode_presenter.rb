# frozen_string_literal: true

class EpisodePresenter < ApplicationPresenter
  def duration
    0 # TODO: Implement duration for audio files
  end

  def explicit
    object.explicit? ? 'yes' : 'clean'
  end

  def pub_date
    object.pub_date.rfc2822
  end
end
