class Admin::KhachHangsController < Admin::ApplicationController

	def index
		@khach_hangs = KhachHang.all
	end

  def show
    @khach_hang = KhachHang.find(params[:id])
  end

end