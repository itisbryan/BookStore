create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
  t.string :label,  null: false, limit: 50
  t.string :short_description, limit: 255
  t.boolean :is_public, null: false, default: true
  t.bigint :user_id, null: false
  t.timestamps
end

add_index :categories, :label, name: "index_categories_on_label", using: :btree
add_index :categories, :user_id
add_foreign_key :categories, :users, column: :user_id