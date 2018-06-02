class HoaDonNhap < ActiveRecord::Base
  belongs_to :nha_cung_cap

  has_many :cthd_nhaps, dependent: :destroy

  accepts_nested_attributes_for :cthd_nhaps, allow_destroy: true,
                                reject_if: proc { |attr| attr['cthd_nhap'].blank? }

  TINH_TRANG_THANH_TOAN = [ "Chưa thanh toán", "Đã thanh toán" ]
end
