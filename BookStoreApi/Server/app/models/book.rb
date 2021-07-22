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
end
