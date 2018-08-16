class User < ActiveRecord::Base
  has_many :occurrences
  has_one :avatar
  has_many :notifications
  has_many :comments
end
