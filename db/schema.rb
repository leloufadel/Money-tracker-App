

ActiveRecord::Schema[7.0].define(version: 2023_10_23_111908) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_purchases", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "purchase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_purchases_on_category_id"
    t.index ["purchase_id"], name: "index_category_purchases_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "users"
  add_foreign_key "category_purchases", "categories"
  add_foreign_key "category_purchases", "purchases"
  add_foreign_key "purchases", "users"
end
