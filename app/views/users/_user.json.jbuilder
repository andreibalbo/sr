json.extract! user, :id, :name, :email, :birth_dt, :cpf, :postal_code, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
