class Article < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  has_many :comments

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
    end
  end

  def as_indexed_json(options={})
  self.as_json(
      :only => [:title,:content],
      :include => {
        comments:   { only: :text }
      })
  end

end
