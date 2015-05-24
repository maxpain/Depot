class Tiding < ActiveRecord::Base
  mount_uploader :image_url, ProductImageUploader
end
