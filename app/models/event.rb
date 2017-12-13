class Event < ApplicationRecord
  has_attached_file :background,
    :url => "/system/:attachment/:id/:style/:filename",
    :default_url => "missing.png"
    validates_attachment_content_type :background, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
end
