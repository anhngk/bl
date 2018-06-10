class CthdNhap < ActiveRecord::Base
  belongs_to :hoa_don_nhap
  belongs_to :hang_hoa

  after_save :increase_so_luong_hang_hoa
  after_destroy :decrease_so_luong_hang_hoa

  def increase_so_luong_hang_hoa
    if self.so_luong_nhap.present?
      hang_hoa.so_luong += self.so_luong_nhap
      hang_hoa.save
    end
  end

  def decrease_so_luong_hang_hoa
    if self.so_luong_nhap.present?
      hang_hoa.so_luong -= self.so_luong_nhap
      hang_hoa.save
    end
  end
end
