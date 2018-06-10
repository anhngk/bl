class CthdXuat < ActiveRecord::Base
  belongs_to :hoa_don_xuat
  belongs_to :hang_hoa

  after_save :decrease_so_luong_hang_hoa
  after_destroy :increase_so_luong_hang_hoa

  def increase_so_luong_hang_hoa
    if self.so_luong_xuat.present?
      hang_hoa.so_luong += self.so_luong_xuat
      hang_hoa.save
    end
  end

  def decrease_so_luong_hang_hoa
    if self.so_luong_xuat.present?
      hang_hoa.so_luong -= self.so_luong_xuat
      hang_hoa.save
    end
  end
end
