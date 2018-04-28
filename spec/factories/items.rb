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

FactoryBot.define do
  factory :item do
    
  end
end
