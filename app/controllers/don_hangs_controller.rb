class DonHangsController < ApplicationController

	include GioHangHienTai
	before_action :set_gio_hang, only: [:index, :show, :new, :create]
	before_action :set_don_hang, only: [:show, :edit, :update, :destroy]

	def index
		@don_hangs = current_khach_hang.don_hangs
	end

	def show
	end

	def edit
	end

	def new
		if @gio_hang.chi_tiet_gio_hangs.empty?
			redirect_to store_url, notice: "Giỏ hàng của bạn chưa có sản phẩm nào"
			return
		end
		@khach_hang = current_khach_hang
		@don_hang = DonHang.new

	end


	def create
		@don_hang = DonHang.new(don_hang_params)
		@don_hang.them_chi_tiet_tu_gio_hang(@gio_hang)
		@don_hang.khach_hang_id = current_khach_hang.id
		@khach_hang = current_khach_hang

		if @don_hang.save
			GioHang.destroy(session[:gio_hang_id])
			session[:gio_hang_id] = nil
			redirect_to don_hang_url(@don_hang), notice: "Bạn đã đặt hàng thành công!"
		else
	        flash[:alert] = "Hãy điền thông tin đầy để chúng tôi có thể xử lý đơn hàng"
			render 'new'
      	end

	end

	private

	def set_don_hang
		@don_hang = DonHang.find(params[:id])
	end

	def don_hang_params
		params.require(:don_hang).permit(:nguoi_nhan, :dia_chi, :email, :tinh_trang, :thanh_toan, :kieu_thanh_toan)
	end

end