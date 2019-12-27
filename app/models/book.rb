class Book < ApplicationRecord
  paginates_per 3
  mount_uploader :picture, PictureUploader
end
