class CreateChiTietGioHangs < ActiveRecord::Migration
  def change
    create_table :chi_tiet_gio_hangs do |t|
      t.references :hang_hoa, index: true, foreign_key: true
      t.belongs_to :gio_hang, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
