class Api::V2::ArticlesController < ApplicationController
  include Swagger::Blocks
  before_action :set_article, only: [:show, :update, :destroy]

  #index
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

  def index
    @articles = Article.all

    render json: @articles
  end


  #show_article
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

  def show
    render json: @article
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
      

  def create
    @article = Article.new(name: params[:name], title: params[:title], body: params[:body], writer: params[:writer], cover_pic: params[:cover_pic])
    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1

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

  def update
    if @article.update(name: params[:name], title: params[:title], body: params[:body], writer: params[:writer], cover_pic: params[:cover_pic])
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
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

  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:name, :title, :body, :writer, :cover_pic)
  end
end
