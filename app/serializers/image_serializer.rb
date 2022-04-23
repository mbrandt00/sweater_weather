class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_url, :photographer, :source, :unsplash_profile
end
