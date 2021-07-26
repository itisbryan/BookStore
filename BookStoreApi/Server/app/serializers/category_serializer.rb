class CategorySerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :label, :short_description, :is_public, :created_at, :updated_at
  belongs_to :user
  has_many :books
end
