# frozen_string_literal: true

class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[show edit update destroy]

  # GET /podcasts
  def index
    @podcasts = Podcast.all
  end

  # GET /podcasts/1
  def show
    @episodes = EpisodePresenter.all(
      @podcast.episodes.order(pub_date: :desc)
    )
  end

  # GET /podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit; end

  # POST /podcasts
  def create
    @podcast = Podcast.new(processed_params)

    if @podcast.save
      redirect_to @podcast, notice: 'Podcast was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /podcasts/1
  def update
    if @podcast.update(processed_params)
      redirect_to @podcast, notice: 'Podcast was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /podcasts/1
  def destroy
    @podcast.destroy
    redirect_to podcasts_url, notice: 'Podcast was successfully destroyed.'
  end

  private

  def set_podcast
    @podcast = PodcastPresenter.new(
      Podcast.find(params[:id])
    )
  end

  def podcast_params
    params.require(:podcast).permit(
      :title,
      :description,
      :language,
      :author,
      :email,
      :explicit,
      :category,
      :channel_type,
      :limit,
      :link,
      :subcategory,
      :target_countries,
      :image,
      :apple_podcasts_url,
      :google_podcasts_url,
      :spotify_url
    )
  end

  def processed_params
    @processed_params ||= podcast_params.tap do |p|
      p[:target_countries] = p[:target_countries].split(' ')
    end
  end
end
