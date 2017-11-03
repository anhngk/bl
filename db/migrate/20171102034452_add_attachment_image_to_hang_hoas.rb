class AddAttachmentImageToHangHoas < ActiveRecord::Migration
  def self.up
    change_table :hang_hoas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :hang_hoas, :image
  end
end
