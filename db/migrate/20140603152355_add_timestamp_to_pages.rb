class AddTimestampToPages < ActiveRecord::Migration
  def change
    add_timestamps(:pages)
  end
end
