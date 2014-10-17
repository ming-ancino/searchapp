class MyRepository
  include Elasticsearch::Persistence::Repository

  index 'my_notes'
  klass Note

  client Elasticsearch::Client.new log: true
end
