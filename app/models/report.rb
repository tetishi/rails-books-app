# frozen_string_literal: true

class Report < ApplicationRecord
  paginates_per 3
  has_many :comments, as: :commentable
  belongs_to :user
end
