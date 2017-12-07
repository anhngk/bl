class AddDatabaseAuhenticableToUser < ActiveRecord::Migration
  def change
    add_column :khach_hangs, :confirmation_token, :string
    add_column :khach_hangs, :confirmed_at, :datetime
    add_column :khach_hangs, :confirmation_sent_at, :datetime
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :khach_hangs, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    KhachHang.all.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end
end
