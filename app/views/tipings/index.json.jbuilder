json.array!(@tipings) do |tiping|
  json.extract! tiping, :id, :title, :description
  json.url tiping_url(tiping, format: :json)
end
