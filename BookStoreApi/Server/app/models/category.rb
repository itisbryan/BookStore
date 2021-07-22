# == Schema Information
#
# Table name: categories
#
#  id                :bigint           not null, primary key
#  is_public         :boolean          default(TRUE), not null
#  label             :string(50)       not null
#  short_description :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_categories_on_label    (label)
#  index_categories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Category < ApplicationRecord

end
