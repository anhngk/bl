class AddTongCongToDonHangs < ActiveRecord::Migration
  def change
    add_column :don_hangs, :tong_cong, :integer
  end
end
