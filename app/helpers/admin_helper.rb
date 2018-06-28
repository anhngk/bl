module AdminHelper
  def tinh_trang_hoa_don(status, truthy: 'Đã thanh toán', falsey: 'Chưa thanh toán')
    if status
      truthy
    else
      falsey
    end
  end

  def active_page(link_path)
    current_page?(link_path) ? "dasboard-menu-active" : ""
  end
end
