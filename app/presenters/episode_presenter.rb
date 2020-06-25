# frozen_string_literal: true

class EpisodePresenter < ApplicationPresenter
  def duration
    audio_file.metadata[:duration]&.round
  end

  def explicit
    object.explicit? ? 'Yes' : 'No'
  end

  def pub_date
    object.pub_date.rfc2822
  end
end
