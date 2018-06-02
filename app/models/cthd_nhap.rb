class CthdNhap < ActiveRecord::Base
  belongs_to :hoa_don_nhap
  belongs_to :hang_hoa
end
