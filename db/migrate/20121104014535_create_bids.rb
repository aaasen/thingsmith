class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.integer :user_id
      t.integer :job_id
      t.float :amount
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
