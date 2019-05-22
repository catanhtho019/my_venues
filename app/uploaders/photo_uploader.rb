class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url
    "https://res.cloudinary.com/dkzdgf49j/image/upload/v1558517355/default_profile_rynyqy.jpg"
  end

end
