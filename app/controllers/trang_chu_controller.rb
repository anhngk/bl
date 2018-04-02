class TrangChuController < ApplicationController

	include GioHangHienTai
	before_action :set_gio_hang

  def index
  	@danh_mucs = DanhMuc.all.limit(9)
  end
end
