class ChangeDevicesStatusStringToBoolean < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      UPDATE devices
      SET status = 
        CASE
          WHEN status = 'ok' THEN true
          WHEN status = 'error' THEN false
        END;
    SQL

    change_column :devices, :status, :boolean, default: true, using: 'status::boolean'
  end
end
