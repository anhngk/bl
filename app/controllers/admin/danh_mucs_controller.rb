class Admin::DanhMucsController < Admin::ApplicationController

  def new
    @danh_muc = DanhMuc.new
    @danh_mucs = DanhMuc.all.order(id: :desc)
  end

  def create
    @danh_muc = DanhMuc.new(danh_muc_params)

    if @danh_muc.save
      redirect_to new_admin_danh_muc_url, notice: 'Thêm danh mục thành công'
    else
      flash[:alert] = 'Có lỗi khi thêm danh mục'
      render 'new'
    end
  end

  def edit
    @danh_muc = DanhMuc.find(params[:id])
  end

  def update
    @danh_muc = DanhMuc.find(params[:id])
    if @danh_muc.update(danh_muc_params)
      redirect_to new_admin_danh_muc_url, notice: 'Chỉnh sửa danh mục thành công'
    else
      flash[:alert] = 'Có lỗi khi sửa danh mục'
      render 'edit'
    end
  end

  def show
    @danh_muc = DanhMuc.find(params[:id])
    @hang_hoas = @danh_muc.hang_hoas
  end

  def destroy
    @danh_muc = DanhMuc.find(params[:id])
    @danh_muc.destroy

    redirect_to :back, notice: 'Đã xóa danh mục'
  end

  private

  def danh_muc_params
    params.require(:danh_muc).permit(:ten_danh_muc, :id)
  end
end
