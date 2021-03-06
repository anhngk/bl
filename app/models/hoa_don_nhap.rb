class HoaDonNhap < ActiveRecord::Base
  belongs_to :nha_cung_cap
  has_many :cthd_nhaps, dependent: :destroy

  accepts_nested_attributes_for :cthd_nhaps, allow_destroy: true

  TINH_TRANG_THANH_TOAN = [ "Chưa thanh toán", "Đã thanh toán" ]

  def self.no_nha_cung_cap
    HoaDonNhap.where(tinh_trang: false).sum(:tong_tien)
  end

end
