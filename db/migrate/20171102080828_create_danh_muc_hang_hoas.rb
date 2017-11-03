class CreateDanhMucHangHoas < ActiveRecord::Migration
  def change
    create_table :danh_muc_hang_hoas do |t|
      t.references :danh_muc, index: true, foreign_key: true
      t.references :hang_hoa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
