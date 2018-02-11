class AddAttachmentAudioToSermons < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sermons do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :sermons, :audio
  end
end
