json.array!(@wells) do |well|
  json.extract! well, :id, :tracking_number, :api_number, :operator_name
  json.url well_url(well, format: :json)
end
