class AddDateToBids < ActiveRecord::Migration
  def change
    add_column :bids, :days, :integer
  end
end
