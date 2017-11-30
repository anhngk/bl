class ChiTietGioHang < ActiveRecord::Base
  belongs_to :hang_hoa
  belongs_to :gio_hang

  def tong_cong
  	hang_hoa.gias.last[:gia_ban] * so_luong
  end
end
