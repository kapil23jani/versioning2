class Api::V2::ArticlesController < ApplicationController
  include Swagger::Blocks
  before_action :set_article, only: [:show, :update, :destroy]


  swagger_path "/articles" do 
    operation :get do 
      key :summary, "Search Article"
      key :description, "Search Article"
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

  # GET /articles/1

  def show
    render json: @article
  end

  # POST /articles

  swagger_path "/articles" do 
    operation :post do 
      key :summary, "Add Article"
      key :description , "Add Article"

      parameter do
        key :name, :name
        key :in, :body
        key :description, 'Article to add '
        key :required, true
        # schema do
        #   key :'$ref', :ArticleInput
        # end
      end

      response 200 do 
        key :success, "Suscess"
      end

      response 400 do 
        key :errors, "Fail"
      end

    end
  end
      

  def create
    @article = Article.new(name: params[:name], title: params[:title], body: params[:body], writer: params[:writer], cover_pic: params[:cover_pic])
    binding.pry
    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(name: params[:name], title: params[:title], body: params[:body], writer: params[:writer], cover_pic: params[:cover_pic])
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
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
