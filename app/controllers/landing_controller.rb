# frozen_string_literal: true

class LandingController < ApplicationController
  layout 'landing'

  skip_before_action :authenticate

  def show
    @podcast = Podcast.find_by!(slug: slug)
    @episodes = EpisodePresenter.all(
      @podcast.episodes.order(pub_date: :desc)
    )
  end

  private

  def slug
    params[:slug] || ''
  end
end
