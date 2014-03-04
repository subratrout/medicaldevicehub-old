json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :name, :email, :password_digest
  json.url manufacturer_url(manufacturer, format: :json)
end