json.array!(@videourls) do |videourl|
  json.extract! videourl, :id, :description, :body_html, :medicaldevice, :manufacturer
  json.url videourl_url(videourl, format: :json)
end
