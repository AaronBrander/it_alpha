json.array!(@boards) do |board|
  json.extract! board, :subdomain, :name, :description, :keywords, :company_name, :address_1, :address_2, :city, :region, :postal_code, :country, :phone_number, :contact_email, :state, :is_private
  json.url board_url(board, format: :json)
end