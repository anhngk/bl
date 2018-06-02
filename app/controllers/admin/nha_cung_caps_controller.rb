class Admin::NhaCungCapsController < Admin::ApplicationController

	def index
		@nha_cung_caps = NhaCungCap.all
	end

	def new
		@nha_cung_cap = NhaCungCap.new
	end

	def create
		@nha_cung_cap = NhaCungCap.new(nha_cung_cap_params)

		if @nha_cung_cap.save
			redirect_to admin_nha_cung_caps_url, notice: 'Thêm nhà cung cấp thành công'
		else
			flash[:alert] = 'Có lỗi khi tiến hành thêm nhà cung cấp'
			render :new
		end
	end

	def edit
		@nha_cung_cap = NhaCungCap.find(params[:id])
	end

	def update
		@nha_cung_cap = NhaCungCap.find(params[:id])
		if @nha_cung_cap.update(nha_cung_cap_params)
			redirect_to admin_nha_cung_caps_url, notice: 'Cập nhật hàng thành công'
		else
			flash[:alert] = 'Có lỗi xảy ra khi cập nhật hàng'
      		render :edit
      	end
	end

	def show
		@nha_cung_cap = NhaCungCap.find(params[:id])
	end

	def destroy
		@nha_cung_cap = NhaCungCap.find(params[:id])
		@nha_cung_cap.destroy
		redirect_to :back, notice: 'Xóa thành công'
	end

	private

	def nha_cung_cap_params
		params.require(:nha_cung_cap).permit(
			:id, :ten_ncc, :ma_so_thue, :dia_chi, :dien_thoai, :ghi_chu, :tien_no
			)
	end

end
