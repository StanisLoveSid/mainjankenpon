json.array!(@users2s) do |users2|
  json.extract! users2, :id, :name, :points, :purchase
  json.url users2_url(users2, format: :json)
end
