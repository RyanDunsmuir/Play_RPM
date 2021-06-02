module ApplicationHelper
  def render_photo(song)
    if song.cover_photo.attached?
      photo_link = url_for(song.cover_photo.attachment)
      cl_image_tag photo_link, height: 400, width: 400, crop: :fill
    else
      cl_image_tag song.cover, height: 400, width: 400, crop: :fill
    end
  end

  def render_audio(song)
    audio_file = url_for(song.file.attachment)
    audio_tag(audio_file.to_s, autoplay: false, controls: true)
  end
end
