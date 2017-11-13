class CreateGia < ActiveRecord::Migration
  def change
    create_table :gia do |t|
      t.decimal :gia_ban
      t.references :hang_hoa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
