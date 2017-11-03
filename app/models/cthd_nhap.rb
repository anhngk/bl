class CthdNhap < ActiveRecord::Base
  belongs_to :hoa_don_nhap
  
  has_many :hang_hoas
end
