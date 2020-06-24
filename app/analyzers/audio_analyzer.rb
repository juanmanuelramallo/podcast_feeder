# frozen_string_literal: true

#
# Uses `ffprobe` to find information about the audio file
#
class AudioAnalyzer < ActiveStorage::Analyzer
  def self.accept?(blob)
    blob.audio?
  end

  def metadata
    {
      duration: duration
    }
  end

  #
  # Duration in seconds
  #
  def duration
    stream['duration'].to_f
  end

  private

  def probe
    download_blob_to_tempfile { |file| probe_from(file) }
  end

  def probe_from(file)
    IO.popen([ffprobe_path, '-print_format', 'json', '-show_streams', '-v', 'error',
              file.path]) do |output|
      JSON.parse(output.read)
    end
  rescue Errno::ENOENT
    logger.info "Skipping audio analysis because FFmpeg isn't installed"
    {}
  end

  def stream
    @stream ||= streams.detect { |stream| stream['codec_type'] == 'audio' } || {}
  end

  def streams
    probe['streams'] || []
  end

  def ffprobe_path
    ActiveStorage.paths[:ffprobe] || 'ffprobe'
  end
end
