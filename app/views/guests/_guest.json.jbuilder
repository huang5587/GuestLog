json.extract! guest, :id, :full_name, :phone_number, :created_at, :updated_at
json.url guest_url(guest, format: :json)
