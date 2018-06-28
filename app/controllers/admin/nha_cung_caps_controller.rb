class Admin::NhaCungCapsController < Admin::ApplicationController
  before_action :set_nha_cung_cap, only: [:show, :edit, :update, :destroy]

	def index
		@nha_cung_caps = NhaCungCap.all
	end

	def new
    layout false
		@nha_cung_cap = NhaCungCap.new
	end

	def create
		@nha_cung_cap = NhaCungCap.new(nha_cung_cap_params)
    respond_to do |format|
      if @nha_cung_cap.save
        format.html { redirect_to admin_nha_cung_caps_url, notice: 'Thêm nhà cung cấp thành công' }
        format.json { render :show, status: :create, location: admin_nha_cung_cap_url(@nha_cung_cap) }
  		else
        format.html { render :new, flash[:alert] = 'Có lỗi khi tiến hành thêm nhà cung cấp' }
  			format.json { render json: @nha_cung_cap.errors, status: :unprocessable_entity }
  		end
    end
	end

	def edit
	end

	def update
		if @nha_cung_cap.update(nha_cung_cap_params)
			redirect_to admin_nha_cung_caps_url, notice: 'Cập nhật hàng thành công'
		else
			flash[:alert] = 'Có lỗi xảy ra khi cập nhật hàng'
      		render :edit
      	end
	end

	def show
	end

	def destroy
		@nha_cung_cap.destroy
		redirect_to :back, notice: 'Xóa thành công'
	end

	private

  def set_nha_cung_cap
    @nha_cung_cap = NhaCungCap.find(params[:id])
  end

	def nha_cung_cap_params
		params.require(:nha_cung_cap).permit(
			:id, :ten_ncc, :ma_so_thue, :dia_chi, :dien_thoai, :ghi_chu, :tien_no
			)
	end

end
