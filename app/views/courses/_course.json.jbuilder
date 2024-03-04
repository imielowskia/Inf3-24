json.extract! course, :id, :name, :ects, :egzam, :field_id, :created_at, :updated_at
json.url course_url(course, format: :json)
