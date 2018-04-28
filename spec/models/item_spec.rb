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

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
