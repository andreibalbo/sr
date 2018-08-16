class Occurrence < ActiveRecord::Base
  has_many :comments
  has_many :images
  has_many :stars
  belongs_to :user
end
