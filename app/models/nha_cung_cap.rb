class NhaCungCap < ActiveRecord::Base

  has_many :hoa_don_nhaps

  def tien_no
    self.tien_no = hoa_don_nhaps.where(tinh_trang: false).sum(:tong_tien)
  end
end
