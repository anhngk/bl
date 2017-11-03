class HoaDonXuat < ActiveRecord::Base
  belongs_to :khach_hang

  has_many :cthd_xuats
end
