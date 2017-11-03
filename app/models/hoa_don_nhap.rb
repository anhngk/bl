class HoaDonNhap < ActiveRecord::Base
  belongs_to :nha_cung_cap

  has_many :cthd_nhaps
end
