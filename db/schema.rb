# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180617111333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chi_tiet_gio_hangs", force: :cascade do |t|
    t.integer  "hang_hoa_id"
    t.integer  "gio_hang_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "so_luong",    default: 1
    t.integer  "don_hang_id"
  end

  add_index "chi_tiet_gio_hangs", ["don_hang_id"], name: "index_chi_tiet_gio_hangs_on_don_hang_id", using: :btree
  add_index "chi_tiet_gio_hangs", ["gio_hang_id"], name: "index_chi_tiet_gio_hangs_on_gio_hang_id", using: :btree
  add_index "chi_tiet_gio_hangs", ["hang_hoa_id"], name: "index_chi_tiet_gio_hangs_on_hang_hoa_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "khach_hang_id"
    t.integer  "hang_hoa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["hang_hoa_id"], name: "index_comments_on_hang_hoa_id", using: :btree
  add_index "comments", ["khach_hang_id"], name: "index_comments_on_khach_hang_id", using: :btree

  create_table "cthd_nhaps", force: :cascade do |t|
    t.string   "ma_cthd_nhap"
    t.integer  "so_luong_nhap"
    t.decimal  "gia_nhap"
    t.integer  "hoa_don_nhap_id"
    t.integer  "hang_hoa_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "thanh_tien"
  end

  add_index "cthd_nhaps", ["hang_hoa_id"], name: "index_cthd_nhaps_on_hang_hoa_id", using: :btree
  add_index "cthd_nhaps", ["hoa_don_nhap_id"], name: "index_cthd_nhaps_on_hoa_don_nhap_id", using: :btree

  create_table "cthd_xuats", force: :cascade do |t|
    t.string   "ma_cthd_xuat"
    t.integer  "so_luong_xuat"
    t.integer  "gia_ban"
    t.integer  "hang_hoa_id"
    t.integer  "hoa_don_xuat_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "thanh_tien"
  end

  add_index "cthd_xuats", ["hang_hoa_id"], name: "index_cthd_xuats_on_hang_hoa_id", using: :btree
  add_index "cthd_xuats", ["hoa_don_xuat_id"], name: "index_cthd_xuats_on_hoa_don_xuat_id", using: :btree

  create_table "danh_mucs", force: :cascade do |t|
    t.string   "ten_danh_muc"
    t.text     "mota"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "don_hangs", force: :cascade do |t|
    t.string   "nguoi_nhan"
    t.string   "dia_chi"
    t.string   "sdt"
    t.string   "email"
    t.string   "tinh_trang"
    t.boolean  "thanh_toan"
    t.string   "kieu_thanh_toan"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "khach_hang_id"
    t.integer  "tong_cong"
  end

  add_index "don_hangs", ["khach_hang_id"], name: "index_don_hangs_on_khach_hang_id", using: :btree

  create_table "gia", force: :cascade do |t|
    t.decimal  "gia_ban"
    t.integer  "hang_hoa_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "gia", ["hang_hoa_id"], name: "index_gia_on_hang_hoa_id", using: :btree

  create_table "gio_hangs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hang_hoas", force: :cascade do |t|
    t.string   "ma_hang"
    t.string   "ten_hang"
    t.string   "xuat_xu"
    t.string   "dvt"
    t.string   "quy_cach"
    t.text     "ghi_chu"
    t.integer  "so_luong"
    t.integer  "moderator_id"
    t.integer  "danh_muc_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "chi_tiet"
  end

  add_index "hang_hoas", ["danh_muc_id"], name: "index_hang_hoas_on_danh_muc_id", using: :btree
  add_index "hang_hoas", ["moderator_id"], name: "index_hang_hoas_on_moderator_id", using: :btree

  create_table "hoa_don_nhaps", force: :cascade do |t|
    t.string   "ma_hd_nhap"
    t.datetime "ngaynhap"
    t.decimal  "tong_tien"
    t.text     "ghi_chu"
    t.boolean  "tinh_trang"
    t.integer  "nha_cung_cap_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "hoa_don_nhaps", ["nha_cung_cap_id"], name: "index_hoa_don_nhaps_on_nha_cung_cap_id", using: :btree

  create_table "hoa_don_xuats", force: :cascade do |t|
    t.string   "ma_hd_xuat"
    t.datetime "ngay_xuat"
    t.decimal  "tong_tien"
    t.text     "ghi_chu"
    t.boolean  "tinh_trang"
    t.integer  "khach_hang_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "hoa_don_xuats", ["khach_hang_id"], name: "index_hoa_don_xuats_on_khach_hang_id", using: :btree

  create_table "khach_hangs", force: :cascade do |t|
    t.string   "kh_id"
    t.string   "ten_kh"
    t.string   "ma_so_thue"
    t.string   "dia_chi"
    t.string   "dien_thoai"
    t.text     "ghi_chu"
    t.decimal  "tien_no"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "khach_hangs", ["confirmation_token"], name: "index_khach_hangs_on_confirmation_token", unique: true, using: :btree
  add_index "khach_hangs", ["email"], name: "index_khach_hangs_on_email", unique: true, using: :btree
  add_index "khach_hangs", ["reset_password_token"], name: "index_khach_hangs_on_reset_password_token", unique: true, using: :btree

  create_table "moderators", force: :cascade do |t|
    t.string   "fullname"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "nha_cung_caps", force: :cascade do |t|
    t.string   "ncc_id"
    t.string   "ten_ncc"
    t.string   "ma_so_thue"
    t.string   "dia_chi"
    t.string   "dien_thoai"
    t.text     "ghi_chu"
    t.decimal  "tien_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  add_foreign_key "chi_tiet_gio_hangs", "don_hangs"
  add_foreign_key "chi_tiet_gio_hangs", "gio_hangs"
  add_foreign_key "chi_tiet_gio_hangs", "hang_hoas"
  add_foreign_key "comments", "hang_hoas"
  add_foreign_key "comments", "khach_hangs"
  add_foreign_key "cthd_nhaps", "hang_hoas"
  add_foreign_key "cthd_nhaps", "hoa_don_nhaps"
  add_foreign_key "cthd_xuats", "hang_hoas"
  add_foreign_key "cthd_xuats", "hoa_don_xuats"
  add_foreign_key "don_hangs", "khach_hangs"
  add_foreign_key "gia", "hang_hoas"
  add_foreign_key "hang_hoas", "danh_mucs"
  add_foreign_key "hang_hoas", "moderators"
  add_foreign_key "hoa_don_nhaps", "nha_cung_caps"
  add_foreign_key "hoa_don_xuats", "khach_hangs"
end
