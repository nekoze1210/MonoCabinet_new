# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  latitude   :float(24)
#  longitude  :float(24)
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_locations_on_item_id  (item_id)
#

class Location < ApplicationRecord
  require 'geocoder'
  Geocoder.configure(:language  => :ja,  :units => :km, :lookup => :google) # 設定
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :latitude, presence: true
  validates :longitude, presence: true
  belongs_to :item
  belongs_to :user
end
