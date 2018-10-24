# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_24_090901) do

  create_table "administrative_user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "administrative_user_id"
    t.datetime "register_date"
    t.index ["administrative_user_id"], name: "fk_rails_0f36febcf6"
    t.index ["role_id"], name: "fk_rails_43e01aa93d"
  end

  create_table "administrative_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "front_editor_name"
    t.string "profile_picture"
    t.string "mail_address"
    t.integer "group", limit: 1
    t.boolean "operational"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "author_type", limit: 1
    t.text "self_introduction"
    t.text "management_note"
    t.index ["user_id"], name: "fk_rails_46e884287b"
  end

  create_table "chapter_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "chapter_id"
    t.string "image_file_name"
    t.integer "order"
    t.datetime "register_date"
    t.index ["chapter_id"], name: "fk_rails_135ef195f8"
  end

  create_table "chapters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.string "thumb_image"
    t.string "chapter_title"
    t.text "overview"
    t.boolean "completion"
    t.string "epub_filename"
    t.boolean "publish"
    t.boolean "stop_publish"
    t.boolean "free"
    t.integer "used_coin_point"
    t.datetime "publish_from"
    t.datetime "publish_to"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["product_id"], name: "fk_rails_89490761e6"
  end

  create_table "coin_point_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "type", limit: 1
    t.integer "value"
    t.datetime "process_date"
    t.text "reason"
    t.index ["user_id"], name: "fk_rails_4b6a73d2e1"
  end

  create_table "comment_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "reporter_user_id"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["comment_id"], name: "fk_rails_2537ad7db4"
    t.index ["reporter_user_id"], name: "fk_rails_51111d2eec"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chapter_id"
    t.bigint "product_id"
    t.bigint "parent_comment_id"
    t.text "comment"
    t.integer "like_count"
    t.boolean "stop_publish"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["chapter_id"], name: "fk_rails_4d60c12392"
    t.index ["parent_comment_id"], name: "fk_rails_da28d53ee7"
    t.index ["product_id"], name: "fk_rails_a0d280f6e4"
    t.index ["user_id"], name: "fk_rails_03de2dc08c"
  end

  create_table "device_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "device_id"
    t.integer "device_os_type"
    t.bigint "user_id"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["user_id"], name: "fk_rails_6cbffed6b7"
  end

  create_table "editor_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "administrative_user_id"
    t.bigint "product_id"
    t.bigint "chapter_id"
    t.text "comment"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["administrative_user_id"], name: "fk_rails_01c75be730"
    t.index ["chapter_id"], name: "fk_rails_8a379a94be"
    t.index ["product_id"], name: "fk_rails_69dddee6ac"
  end

  create_table "favorite_authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "author_id"
    t.datetime "register_date"
    t.index ["author_id"], name: "fk_rails_94ffbb7617"
    t.index ["user_id"], name: "fk_rails_4d6713f52f"
  end

  create_table "favorite_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "register_date"
    t.index ["product_id"], name: "fk_rails_00410a4664"
    t.index ["user_id"], name: "fk_rails_27f0bce582"
  end

  create_table "follow_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "follow_user_id"
    t.bigint "target_user_id"
    t.datetime "update_date"
    t.index ["follow_user_id"], name: "fk_rails_7e5e0d5e18"
    t.index ["target_user_id"], name: "fk_rails_33a1d2ea42"
  end

  create_table "genre_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "product_id"
    t.index ["category_id"], name: "fk_rails_d89558e1ed"
    t.index ["product_id"], name: "fk_rails_27ad7e5dbb"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "genre_name"
    t.integer "sort", unsigned: true
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "like_chapters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "chapter_id"
    t.bigint "user_id"
    t.datetime "update_date"
    t.index ["chapter_id"], name: "fk_rails_21ec853f3d"
    t.index ["product_id"], name: "fk_rails_7573e8fe8c"
    t.index ["user_id"], name: "fk_rails_55d6bd21f5"
  end

  create_table "like_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "register_date"
    t.index ["comment_id"], name: "fk_rails_c566ae3906"
    t.index ["user_id"], name: "fk_rails_276b57ce5a"
  end

  create_table "ng_words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ng_word"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "subject"
    t.text "content"
    t.datetime "publish_date"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "posting_apply_requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.bigint "chapter_id"
    t.integer "censorship_status", limit: 1
    t.text "reject_reason"
    t.text "management_notes"
    t.bigint "administrative_user_in_charge"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["administrative_user_in_charge"], name: "fk_rails_a3d1d05789"
    t.index ["chapter_id"], name: "fk_rails_4464cf16d3"
    t.index ["product_id"], name: "fk_rails_352e9d8c6d"
    t.index ["user_id"], name: "fk_rails_84324fa32d"
  end

  create_table "product_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "reporter_user_id"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["product_id"], name: "fk_rails_c1a25f808b"
    t.index ["reporter_user_id"], name: "fk_rails_fd849382ae"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "author_id"
    t.integer "product_type", limit: 1
    t.string "product_title"
    t.text "list_overview"
    t.text "detail_overview"
    t.string "cover_image"
    t.string "thumb_image"
    t.string "key_visual_image"
    t.integer "reading_type", limit: 1
    t.boolean "publish"
    t.boolean "stop_publish"
    t.datetime "publish_from"
    t.datetime "publish_to"
    t.integer "days_in_week", limit: 1
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["author_id"], name: "fk_rails_fcdcd47b60"
  end

  create_table "proxy_approval_settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "administrative_user_id"
    t.datetime "proxy_period_from"
    t.datetime "proxy_period_to"
    t.datetime "register_date"
    t.index ["administrative_user_id"], name: "fk_rails_a045103b11"
  end

  create_table "proxy_approval_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "proxy_approval_setting_id"
    t.bigint "proxy_approval_admin_user_id"
    t.datetime "register_date"
    t.index ["proxy_approval_admin_user_id"], name: "fk_rails_8dca5c87a7"
    t.index ["proxy_approval_setting_id"], name: "fk_rails_0a7adcca1a"
  end

  create_table "qas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "qa_type"
    t.string "nickname"
    t.string "mail_address"
    t.integer "status", limit: 1
    t.string "title"
    t.text "content"
    t.text "response_content"
    t.datetime "register_date"
    t.datetime "update_date"
    t.string "device_id"
    t.integer "terminal_os_type", limit: 1
    t.boolean "del_flg", default: false
  end

  create_table "reading_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.bigint "chapter_id"
    t.datetime "reading_date"
    t.index ["chapter_id"], name: "fk_rails_e80f805142"
    t.index ["product_id"], name: "fk_rails_9dde2c05e3"
    t.index ["user_id"], name: "fk_rails_bb1362d940"
  end

  create_table "role_functions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "role_function_name"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "role_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "reject_role_func_id"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["reject_role_func_id"], name: "fk_rails_b096e13e25"
    t.index ["role_id"], name: "fk_rails_5e0baa4d22"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "role_name"
    t.integer "sort_by", unsigned: true
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "search_keyword_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "search_keyword"
    t.integer "search_count"
    t.datetime "last_search_date"
    t.datetime "register_date"
    t.index ["user_id"], name: "fk_rails_55bdb9508c"
  end

  create_table "subscribe_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.string "product_name"
    t.bigint "chapter_id"
    t.string "chapter_name"
    t.datetime "subscribed_date"
    t.integer "used_coint_point"
    t.integer "used_type", limit: 1
    t.integer "device_os_type", limit: 1
    t.index ["chapter_id"], name: "fk_rails_f4de2b4b68"
    t.index ["product_id"], name: "fk_rails_b5b53ec68f"
    t.index ["user_id"], name: "fk_rails_1aa1dd06ee"
  end

  create_table "tag_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "fk_rails_bd844f76c5"
    t.index ["tag_id"], name: "fk_rails_1d9147ab8d"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
  end

  create_table "user_recommends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.text "recommend_comment"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.index ["product_id"], name: "fk_rails_b715f64663"
    t.index ["user_id"], name: "fk_rails_248b3a2d24"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname"
    t.string "password"
    t.integer "gender", limit: 1
    t.datetime "birthday"
    t.string "mail_address"
    t.string "fb_link"
    t.string "gg_link"
    t.string "tw_link"
    t.integer "current_point"
    t.integer "current_coin"
    t.string "profile_picture"
    t.boolean "deactive"
    t.text "reason_of_deactive"
    t.text "management_notes"
    t.datetime "register_date"
    t.datetime "update_date"
    t.boolean "del_flg", default: false
    t.string "encrypted_password"
    t.string "provider"
    t.integer "uid"
    t.string "tokens"
  end

  add_foreign_key "administrative_user_roles", "administrative_users"
  add_foreign_key "administrative_user_roles", "roles"
  add_foreign_key "authors", "users"
  add_foreign_key "chapter_images", "chapters"
  add_foreign_key "chapters", "products"
  add_foreign_key "coin_point_histories", "users"
  add_foreign_key "comment_reports", "comments"
  add_foreign_key "comment_reports", "users", column: "reporter_user_id"
  add_foreign_key "comments", "chapters"
  add_foreign_key "comments", "comments", column: "parent_comment_id"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "device_users", "users"
  add_foreign_key "editor_comments", "administrative_users"
  add_foreign_key "editor_comments", "chapters"
  add_foreign_key "editor_comments", "products"
  add_foreign_key "favorite_authors", "authors"
  add_foreign_key "favorite_authors", "users"
  add_foreign_key "favorite_products", "products"
  add_foreign_key "favorite_products", "users"
  add_foreign_key "follow_users", "users", column: "follow_user_id"
  add_foreign_key "follow_users", "users", column: "target_user_id"
  add_foreign_key "genre_products", "genres", column: "category_id"
  add_foreign_key "genre_products", "products"
  add_foreign_key "like_chapters", "chapters"
  add_foreign_key "like_chapters", "products"
  add_foreign_key "like_chapters", "users"
  add_foreign_key "like_comments", "comments"
  add_foreign_key "like_comments", "users"
  add_foreign_key "posting_apply_requests", "administrative_users", column: "administrative_user_in_charge"
  add_foreign_key "posting_apply_requests", "chapters"
  add_foreign_key "posting_apply_requests", "products"
  add_foreign_key "posting_apply_requests", "users"
  add_foreign_key "product_reports", "products"
  add_foreign_key "product_reports", "users", column: "reporter_user_id"
  add_foreign_key "products", "authors"
  add_foreign_key "proxy_approval_settings", "administrative_users"
  add_foreign_key "proxy_approval_users", "administrative_users", column: "proxy_approval_admin_user_id"
  add_foreign_key "proxy_approval_users", "proxy_approval_settings"
  add_foreign_key "reading_histories", "chapters"
  add_foreign_key "reading_histories", "products"
  add_foreign_key "reading_histories", "users"
  add_foreign_key "role_items", "role_functions", column: "reject_role_func_id"
  add_foreign_key "role_items", "roles"
  add_foreign_key "search_keyword_histories", "users"
  add_foreign_key "subscribe_histories", "chapters"
  add_foreign_key "subscribe_histories", "products"
  add_foreign_key "subscribe_histories", "users"
  add_foreign_key "tag_products", "products"
  add_foreign_key "tag_products", "tags"
  add_foreign_key "user_recommends", "products"
  add_foreign_key "user_recommends", "users"
end
