class AddAttachmentResourcesToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :resources
    end
  end

  def self.down
    remove_attachment :books, :resources
  end
end
