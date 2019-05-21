class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default_profile.jpg"].compact.join('_'))
  end
  # Remove everything else
end
