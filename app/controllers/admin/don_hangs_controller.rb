class Admin::DonHangsController < Admin::ApplicationController

	include GioHangHienTai
	before_action :set_gio_hang, only: [:new, :create]
	before_action :set_don_hang, only: [:show, :edit, :update, :destroy]

	def index
		@don_hangs = DonHang.all
	end

	def show
		
	end

	def edit
	end

	def update
		if @don_hang.update(don_hang_params)
			redirect_to admin_don_hangs_url, notice: 'Cập nhật đơn hàng thành công'
		else
      		flash[:alert] = 'Có lỗi khi cập nhật đơn hàng'
      		render 'edit'
    end
	end

	def new
		if @gio_hang.chi_tiet_gio_hangs.empty?
			redirect_to store_url, notice: "Giỏ hàng của bạn chưa có sản phẩm nào"
			return
		end
		@don_hang = DonHang.new
	end


	def create
		@don_hang = DonHang.new(don_hang_params)
		@don_hang.them_chi_tiet_tu_gio_hang(@gio_hang)

		if @don_hang.save
			GioHang.destroy(session[:gio_hang_id])
			session[:gio_hang_id] = nil
		else
	        format.html { render action: 'new' }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
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