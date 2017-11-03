class CthdXuat < ActiveRecord::Base
  belongs_to :hoa_don_xuat

  has_many :hang_hoas
end
