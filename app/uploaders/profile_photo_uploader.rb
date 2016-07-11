class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    # "/public/uploads/user/profile_photo/#{user.id}/file_name"
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
