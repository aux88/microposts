class AddRetweetedIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :retweeted_id, :integer
  end
end
