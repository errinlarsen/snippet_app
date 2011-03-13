class Snippet
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String
  field :tags, :type => String
  field :text, :type => String
end
