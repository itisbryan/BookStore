# frozen_string_literal: true

create_table 'books', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin' do |t|
  t.string :isbn, null: false, limit: 20
  t.string :title, null: false
  t.string :short_description, limit: 255
  t.integer :published_year, null: false
  t.string :publisher, null: false
  t.string :author_name, null: false
  t.float :price, null: false

  t.bigint :user_id, null: false
  t.bigint :category_id, null: false
  t.timestamps
end

add_index :books, :isbn, name: 'index_books_on_isbn', unique: true, using: :btree
add_index :books, :user_id, name: 'index_books_on_user_id'
add_index :books, :category_id, name: 'index_books_on_category_id'
add_foreign_key :books, :users, column: :user_id
add_foreign_key :books, :categories, column: :category_id
