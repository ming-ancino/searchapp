class Comment < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :article

  after_commit on: [:create] do
    self.article.__elasticsearch__.index_document
  end

  after_commit on: [:update] do
    self.article.__elasticsearch__.update_document
  end

  after_commit on: [:destroy] do
    self.article.__elasticsearch__.delete_document
  end

end
