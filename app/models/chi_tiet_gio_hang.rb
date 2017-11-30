class ChiTietGioHang < ActiveRecord::Base
  belongs_to :hang_hoa
  belongs_to :gio_hang
  belongs_to :don_hang

  def gia_ban
  	hang_hoa.gias.last[:gia_ban]
  end

  def tong_cong
  	hang_hoa.gias.last[:gia_ban] * so_luong
  end
end
