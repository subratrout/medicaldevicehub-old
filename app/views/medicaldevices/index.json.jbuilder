json.array!(@medicaldevices) do |medicaldevice|
  json.extract! medicaldevice, :pmak_number, :applicant, :street1, :street2, :city, :state, :zip, :generic_name, :trade_name, :product_code, :advisory_committee, :description
  json.url medicaldevice_url(medicaldevice, format: :json)
end
