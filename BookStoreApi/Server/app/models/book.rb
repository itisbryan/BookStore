# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id                :bigint           not null, primary key
#  author_name       :string(255)      not null
#  isbn              :string(20)       not null
#  price             :float(24)        not null
#  published_year    :integer          not null
#  publisher         :string(255)      not null
#  short_description :string(255)
#  title             :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_books_on_category_id  (category_id)
#  index_books_on_isbn         (isbn) UNIQUE
#  index_books_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Book < ApplicationRecord
  validates_presence_of %i[isbn title publisher author_name published_year]
  validates_uniqueness_of :isbn, scope: %i[title]
  validates_numericality_of :price, greater_than_or_equal_to: 0, message: ''
  validates_numericality_of :published_year, greater_than_or_equal_to: 0,
                                             less_than_or_equal_to: Date.today.year.to_i,
                                             message: ''

  belongs_to :user
  belongs_to :category

  validates_associated :category, :user
end
