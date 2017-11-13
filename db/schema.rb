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

ActiveRecord::Schema.define(version: 20171109111158) do

  create_table "cthd_nhaps", force: :cascade do |t|
    t.string   "ma_cthd_nhap",    limit: 255
    t.integer  "so_luong_nhap",   limit: 4
    t.decimal  "gia_nhap",                    precision: 10
    t.integer  "hoa_don_nhap_id", limit: 4
    t.integer  "hang_hoa_id",     limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "cthd_nhaps", ["hang_hoa_id"], name: "index_cthd_nhaps_on_hang_hoa_id", using: :btree
  add_index "cthd_nhaps", ["hoa_don_nhap_id"], name: "index_cthd_nhaps_on_hoa_don_nhap_id", using: :btree

  create_table "cthd_xuats", force: :cascade do |t|
    t.string   "ma_cthd_xuat",    limit: 255
    t.integer  "so_luong_xuat",   limit: 4
    t.integer  "gia_ban",         limit: 4
    t.integer  "hang_hoa_id",     limit: 4
    t.integer  "hoa_don_xuat_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "cthd_xuats", ["hang_hoa_id"], name: "index_cthd_xuats_on_hang_hoa_id", using: :btree
  add_index "cthd_xuats", ["hoa_don_xuat_id"], name: "index_cthd_xuats_on_hoa_don_xuat_id", using: :btree

  create_table "danh_muc_hang_hoas", force: :cascade do |t|
    t.integer  "danh_muc_id", limit: 4
    t.integer  "hang_hoa_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "danh_muc_hang_hoas", ["danh_muc_id"], name: "index_danh_muc_hang_hoas_on_danh_muc_id", using: :btree
  add_index "danh_muc_hang_hoas", ["hang_hoa_id"], name: "index_danh_muc_hang_hoas_on_hang_hoa_id", using: :btree

  create_table "danh_mucs", force: :cascade do |t|
    t.string   "danh_muc_id",  limit: 255
    t.string   "ten_danh_muc", limit: 255
    t.text     "mota",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "gia", force: :cascade do |t|
    t.decimal  "gia_ban",               precision: 10
    t.integer  "hang_hoa_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "gia", ["hang_hoa_id"], name: "index_gia_on_hang_hoa_id", using: :btree

  create_table "hang_hoas", force: :cascade do |t|
    t.string   "ma_hang",            limit: 255
    t.string   "ten_hang",           limit: 255
    t.string   "xuat_xu",            limit: 255
    t.string   "dvt",                limit: 255
    t.string   "quy_cach",           limit: 255
    t.text     "ghi_chu",            limit: 65535
    t.integer  "so_luong",           limit: 4
    t.integer  "moderator_id",       limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "hang_hoas", ["moderator_id"], name: "index_hang_hoas_on_moderator_id", using: :btree

  create_table "hoa_don_nhaps", force: :cascade do |t|
    t.string   "ma_hd_nhap",      limit: 255
    t.datetime "ngaynhap"
    t.decimal  "tong_tien",                     precision: 10
    t.text     "ghi_chu",         limit: 65535
    t.boolean  "tinh_trang"
    t.integer  "nha_cung_cap_id", limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "hoa_don_nhaps", ["nha_cung_cap_id"], name: "index_hoa_don_nhaps_on_nha_cung_cap_id", using: :btree

  create_table "hoa_don_xuats", force: :cascade do |t|
    t.string   "ma_hd_xuat",    limit: 255
    t.datetime "ngay_xuat"
    t.decimal  "tong_tien",                   precision: 10
    t.text     "ghi_chu",       limit: 65535
    t.boolean  "tinh_trang"
    t.integer  "khach_hang_id", limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "hoa_don_xuats", ["khach_hang_id"], name: "index_hoa_don_xuats_on_khach_hang_id", using: :btree

  create_table "khach_hangs", force: :cascade do |t|
    t.string   "kh_id",      limit: 255
    t.string   "ten_kh",     limit: 255
    t.string   "ma_so_thue", limit: 255
    t.string   "dia_chi",    limit: 255
    t.string   "dien_thoai", limit: 255
    t.text     "ghi_chu",    limit: 65535
    t.decimal  "tien_no",                  precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "moderators", force: :cascade do |t|
    t.string   "fullname",        limit: 255
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "nha_cung_caps", force: :cascade do |t|
    t.string   "ncc_id",     limit: 255
    t.string   "ten_ncc",    limit: 255
    t.string   "ma_so_thue", limit: 255
    t.string   "dia_chi",    limit: 255
    t.string   "dien_thoai", limit: 255
    t.text     "ghi_chu",    limit: 65535
    t.decimal  "tien_no",                  precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_foreign_key "cthd_nhaps", "hang_hoas"
  add_foreign_key "cthd_nhaps", "hoa_don_nhaps"
  add_foreign_key "cthd_xuats", "hang_hoas"
  add_foreign_key "cthd_xuats", "hoa_don_xuats"
  add_foreign_key "danh_muc_hang_hoas", "danh_mucs"
  add_foreign_key "danh_muc_hang_hoas", "hang_hoas"
  add_foreign_key "gia", "hang_hoas"
  add_foreign_key "hang_hoas", "moderators"
  add_foreign_key "hoa_don_nhaps", "nha_cung_caps"
  add_foreign_key "hoa_don_xuats", "khach_hangs"
end
