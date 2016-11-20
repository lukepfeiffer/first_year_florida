class Experience < ActiveRecord::Base
  scope :active, -> {where(archive_date: nil)}
  scope :archived, -> {where.not(archive_date: nil)}
  belongs_to :user

  validates_presence_of :title, :image_url
end
