class HoaDonXuat < ActiveRecord::Base
  belongs_to :khach_hang
  has_many :cthd_xuats, dependent: :destroy
  accepts_nested_attributes_for :cthd_xuats, allow_destroy: true
end
