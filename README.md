# SR

## yeee

rails new sr

(docker files)

puma -> gemfile

puma -p 3000

rails g scaffold User name:string birth_dt:date cpf:string postal_code:string phone:string

rails g scaffold Occurrence date:date location:string description:string stars:integer

rails g model Avatar base64:string

rails g model Image base64:string

rails g model Notification message:string read:boolean

rails g model Comment date:date

rails g model Star from:integer to:integer


rails g migration add_user_to_notifications user:references

rails g migration add_user_to_occurrences user:references

rails g migration add_user_to_comments user:references

rails g migration add_occurrence_to_comments occurrence:references

rails g migration add_user_to_avatar user:references

rails g migration add_occurrence_to_images occurrence:references

rails g migration add_occurrence_to_stars occurrence:references

rails g migration add_user_to_stars user:references


rails g devise:install

rails g devise User

migrate

updated nodejs due a problem with bootstrap but it was added to dockerfile
