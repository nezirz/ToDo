class AddAttachmentPhotoToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :tasks, :photo
  end
end
