class AddEventTimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :event_time, :datetime
    add_column :tasks, :assigned_to, :integer
  end
end
