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
end
