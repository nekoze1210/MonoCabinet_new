# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  item_name  :string(255)
#  maker      :string(255)
#  image_url  :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_items_on_user_id  (user_id)
#

class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :locations, dependent: :destroy

  validates :item_name, presence: true

  accepts_nested_attributes_for :locations,  allow_destroy: true, reject_if: :all_blank
end
