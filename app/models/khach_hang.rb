class KhachHang < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :don_hangs
    has_many :hoa_don_xuats
    ratyrate_rater
    devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

    accepts_nested_attributes_for 	:don_hangs,
									allow_destroy: true

  def tien_no
    self.tien_no = hoa_don_xuats.where(tinh_trang: false).sum(:tong_tien)
  end

  def self.top_khach_hang
    KhachHang.joins(:hoa_don_xuats).select('SUM(tong_tien) as total', 'khach_hangs.id', 'khach_hangs.email', 'khach_hangs.ten_kh').group('khach_hangs.id').order('total desc').limit(10)
  end
end
