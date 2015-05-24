json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :title, :description, :country, :city
  json.url manufacturer_url(manufacturer, format: :json)
end
