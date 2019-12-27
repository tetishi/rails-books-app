# frozen_string_literal: true

class Book < ApplicationRecord
  paginates_per 3
  mount_uploader :picture, PictureUploader
  has_many :comments, as: :commentable
  belongs_to :user
end
