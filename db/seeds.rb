# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'base64'

User.create(name: 'asd', email: 'asd@asd.com', password: '123456')
Occurrence.create(date:'10-10-18', location: 'rua tal', description: 'descricao1', user_id: 1, occurrence_type: false, animal_type: 'Cachorro', animal_color: 'Branco', animal_size: 'Grande')
Occurrence.create(date:'10-11-18', location: 'rua talx', description: 'descricao2', user_id: 1, occurrence_type: false, animal_type: 'Gato', animal_color: 'Amarelo', animal_size: 'Pequeno')
Occurrence.create(date:'10-12-18', location: 'rua talzxc', description: 'descricao3', user_id: 1, occurrence_type: true, animal_type: 'Cachorro', animal_color: 'Branco', animal_size: 'Medio')
Occurrence.create(date:'10-13-18', location: 'rua talasd', description: 'descricao4', user_id: 1, occurrence_type: true, animal_type: 'Gato', animal_color: 'Verde', animal_size: 'Medio')
Occurrence.create(date:'10-14-18', location: 'rua tal123', description: 'descricao5', user_id: 1, occurrence_type: false, animal_type: 'Cachorro', animal_color: 'Preto', animal_size: 'Grande')

file = File.read("#{Rails.root}/app/assets/images/dog1.png")
b64 = Base64.strict_encode64(file)
Image.create(occurrence_id:1, base64: b64)
file = File.read("#{Rails.root}/app/assets/images/cat1.png")
b64 = Base64.strict_encode64(file)
Image.create(occurrence_id:2, base64: b64)
file = File.read("#{Rails.root}/app/assets/images/dog2.png")
b64 = Base64.strict_encode64(file)
Image.create(occurrence_id:3, base64: b64)
file = File.read("#{Rails.root}/app/assets/images/cat2.png")
b64 = Base64.strict_encode64(file)
Image.create(occurrence_id:4, base64: b64)
file = File.read("#{Rails.root}/app/assets/images/dog3.png")
b64 = Base64.strict_encode64(file)
Image.create(occurrence_id:5, base64: b64)
