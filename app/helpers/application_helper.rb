module ApplicationHelper
  def render_photo(song)
    if song.cover_photo.attached?
      # photo_link = url_for(song.cover_photo.attachment)
      cl_image_tag song.cover_photo.key, height: 400, width: 400, crop: :fill
    else
      cl_image_tag song.cover, height: 400, width: 400, crop: :fill
    end
  end

  def render_cart_photo(song)
    if song.cover_photo.attached?
      # photo_link = url_for(song.cover_photo.attachment)
      cl_image_tag song.cover_photo.key, height: 100, width: 100, crop: :fill, class: "order-image"
    else
      cl_image_tag song.cover, height: 100, width: 100, crop: :fill, class: "order-image"
    end
  end

  def render_acc_phots(song)
    if song.cover_photo.attached?
      # photo_link = url_for(song.cover_photo.attachment)
      cl_image_tag song.cover_photo.key, height: 100, width: 100, crop: :fill, class: "order-artworks"
    else
      cl_image_tag song.cover, height: 100, width: 100, crop: :fill, class: "order-artworks"
    end
  end

  def render_audio(song)
    # audio_file = url_for(song.file.attachment)
    if song.file.attached?
      cl_video_tag(song.file.key, autoplay: false, controls: true, :height => 60, :width => 300, :crop => "scale")
    else
      audio_tag("https://res.cloudinary.com/ryanthewizard/video/upload/v1622630872/0rso2o8ck371zccvi59qzsphpui8.mp3", autoplay: false, controls: true)
    end
  end

  def profile_greeting
    case Time.zone.now.hour
    when 4..11 then 'Bom dia'
    when 12..17 then 'Boa tarde'
    when 18..23 then 'Boa noite'
    else
      'Olá'
    end
  end
end
