json.extract! post, :id, :date, :time, :destination, :departure_location, :number_passengers, :created_at, :updated_at
json.url post_url(post, format: :json)
