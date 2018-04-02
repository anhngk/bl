class AddAvatarToDanhMucs < ActiveRecord::Migration
  def up
  	add_attachment :danh_mucs, :avatar
  end

  def down
  	remove_attachment :danh_mucs, :avatar
  end
end
