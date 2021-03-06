class HoaDonXuat < ActiveRecord::Base
  belongs_to :khach_hang
  has_many :cthd_xuats, dependent: :destroy
  accepts_nested_attributes_for :cthd_xuats, allow_destroy: true

  def self.doanh_thu_nam
    HoaDonXuat.group("date_part('year',ngay_xuat)").order("date_part('year',ngay_xuat)").where(tinh_trang: true).sum(:tong_tien)
  end

  def self.doanh_thu_theo_thang
    HoaDonXuat.group("date_part('month',ngay_xuat)").order("date_part('month',ngay_xuat)").where(tinh_trang: true).sum(:tong_tien)
  end

  def self.doanh_thu_hom_nay
    HoaDonXuat.where('DATE(ngay_xuat) = ?', Date.today).sum(:tong_tien)
  end

  def self.khach_hang_no
    HoaDonXuat.where(tinh_trang: false).sum(:tong_tien)
  end
end
