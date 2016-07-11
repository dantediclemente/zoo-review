class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "/public/uploads/user/profile_photo/#{user.id}/file_name"
  end
end
