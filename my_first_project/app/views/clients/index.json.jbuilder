json.array!(@clients) do |client|
  json.extract! client, :id, :name, :surname, :address, :NIF
  json.url client_url(client, format: :json)
end
