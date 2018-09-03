class Occurrence < ActiveRecord::Base
  has_many :comments
  has_many :images
  has_many :stars
  belongs_to :user

  def self.lost
    Occurrence.where(occurrence_type: false)
  end

  def self.found
    Occurrence.where(occurrence_type: true)
  end



end
