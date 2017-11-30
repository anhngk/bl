class CreateGioHangs < ActiveRecord::Migration
  def change
    create_table :gio_hangs do |t|

      t.timestamps null: false
    end
  end
end
