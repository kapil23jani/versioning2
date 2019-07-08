class SwaggerController < ApplicationController
  include Swagger::Blocks

  #index/articles
  swagger_path "/articles" do 
    operation :get do 
      key :summary, "Search Article"
      key :description, "Search Article"
      key :tags, [
                'Articles'
            ]
      response 200 do 
        key :description, "Article Found"
      end

      response 400 do 
        key :description, "Error"
      end
    end
  end

  #show_article/article
  swagger_path "/articles/{id}" do 
    operation :get do 
      key :summary, "Find Article"
      key :description, "Find Article"
      key :tags, [
                'Articles'
            ]
      parameter do 
        key :name, :id
        key :in, :path
        key :type, :integer
        key :required, true
      end

      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "Error"
      end
    end
  end

  # POST /articles
  swagger_path "/articles" do 
    operation :post do 
      key :summary, "Add Article"
      key :description , "Add Article"
      key :tags, [
                'Articles'
            ]
      parameter do
        key :name, :name
        key :in, :formData
        key :description, 'Article to add '
        key :required, true
      end
       parameter do
        key :name, :title
        key :in, :formData
        key :description, 'Title'
        key :required, true
      end
       parameter do
        key :name, :body
        key :in, :formData
        key :description, 'Body'
        key :required, true
      end
       parameter do
        key :name, :writer
        key :in, :formData
        key :description, 'Writer'
        key :required, true
      end
      response 200 do 
        key :description, "Suscess"
      end
      response 400 do 
        key :description, "Fail"
      end
    end
  end


  #update/article
  swagger_path "/articles/{id}" do 
    operation :put do 
      key :description, "Update Article"
      key :summary, "Update Article"
      key :tags, [
                'Articles'
            ]
      parameter do 
        key :name, :id
        key :in, :path
      end
       parameter do 
        key :name, :name
        key :in, :formData
      end
       parameter do 
        key :name, :title
        key :in, :formData
      end
       parameter do 
        key :name, :body
        key :in, :formData
      end
       parameter do 
        key :name, :writer
        key :in, :formData
      end
      response 200 do 
        key :description, "Sucess"
      end
      response 400 do 
        key :description, "Error"
      end
    end
  end


  # DELETE /articles/1
  swagger_path "/articles/{id}" do
    operation :delete do 
      key :summary, "Delete Article"
      key :description, "Delete Article"
      key :operationId, "Delete Article"
      key :tags, [
                'Articles'
            ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "ID"
        key :type, :integer
      end
      response 200 do 
        key :description, "Successfully Deleted"
      end
      response 400 do 
        key :description, "Oops Error While deleting the Record"
      end
    end
  end

  #----------------------------------------------------------------------CommentsController----------------------------------------------------------------------------


  swagger_path "/comments" do
    operation :get do 
      put :summary, "Comments of Article"
      put :description, "All Comments"

      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "Error"
      end

    end
  end



end