module AdminHelper
  def tinh_trang_hoa_don(status, truthy: 'Đã thanh toán', falsey: 'Chưa thanh toán')
    if status
      truthy
    else
      falsey
    end
  end
end
