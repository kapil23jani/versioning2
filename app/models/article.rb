class Article < ApplicationRecord
    include Swagger::Blocks

  has_one_attached :cover_pic
  has_many_attached :docs

   ## Swagger Doc ##
  swagger_schema :Article do
    key :required, [:name, :title]
    property :name do
        key :type, :string
    end
    property :title do
        key :type, :string
        # key :format, :int64
    end
  end
end
