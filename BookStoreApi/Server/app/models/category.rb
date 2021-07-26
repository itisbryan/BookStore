# frozen_string_literal: true

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
  # Validates attribute label
  validates_presence_of :label
  validates_length_of :label, maximum: 255, message: 'less than 255 characters'
  validates_uniqueness_of :label, condition: -> { where(is_public: true) }

  has_many :books, foreign_key: :category_id, dependent: :destroy
  belongs_to :user

  validates_associated :books, :user
end
