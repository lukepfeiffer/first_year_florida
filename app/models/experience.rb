class Experience < ActiveRecord::Base
  scope :active, -> {where(archive_date: nil)}
  scope :archived, -> {where.not(archive_date: nil)}
  belongs_to :user
end
