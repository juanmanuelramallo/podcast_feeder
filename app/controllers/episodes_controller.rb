# frozen_string_literal: true

class EpisodesController < ApplicationController
  before_action :set_episode, only: %i[show edit update destroy]
  before_action :set_podcast

  # GET /episodes/1
  def show; end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit; end

  # POST /episodes
  def create
    @episode = Episode.new(episode_params.merge(guid: SecureRandom.uuid, podcast: @podcast))

    if @episode.save
      @episode.audio_file.analyze
      redirect_to @podcast, notice: 'Episode was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /episodes/1
  def update
    if @episode.update(episode_params)
      redirect_to @podcast, notice: 'Episode was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /episodes/1
  def destroy
    @episode.destroy
    redirect_to @podcast, notice: 'Episode was successfully destroyed.'
  end

  private

  def set_episode
    @episode = EpisodePresenter.new(
      Episode.find(params[:id])
    )
  end

  def set_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end

  def episode_params
    params.require(:episode).permit(
      :audio_file,
      :description,
      :explicit,
      :guid,
      :image,
      :keywords,
      :pub_date,
      :title
    )
  end
end
