class AddChiTietToHangHoas < ActiveRecord::Migration
  def change
    add_column :hang_hoas, :chi_tiet, :text
  end
end
