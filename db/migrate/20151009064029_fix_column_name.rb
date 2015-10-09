class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :assigned_to, :created_by
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
