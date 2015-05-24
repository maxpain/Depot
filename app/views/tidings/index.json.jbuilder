json.array!(@tidings) do |tiding|
  json.extract! tiding, :id, :title, :description, :image_url
  json.url tiding_url(tiding, format: :json)
end
