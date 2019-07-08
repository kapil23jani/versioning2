class Api::V2::UsersController < ApplicationController

  include Swagger::Blocks


  #api for index method
  swagger_path "/users" do 
    operation :get do 
      key :summary, "Get All Users"
      key :description, "All Users"
      key :tags, [
                'Users'
            ]
      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "Error"
      end
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  #api for creating new user
  swagger_path "/users" do 
    operation :post do 
      key :summary, "Create New User"
      key :description, "Create New User"
      key :tags, [
        "Users"
      ]

      parameter do 
        key :name, :email
        key :in, :formData
        key :description, "Email"
        key :type, :string
      end

      parameter do 
        key :name, :password
        key :in, :formData
        key :format, :password
        key :description, "Password"
        #key :format, :string
      end

      parameter do 
        key :name, :password_confirmation
        key :in, :formData
        key :format, :password
        key :description, "Confirm Password"
        #ey :type, :string
      end

      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "Error"
      end
    end
  end

  def create 
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      render json: @user
    end
  end


  #api for showing user

  swagger_path "/users/{id}" do 
    operation :get do 
      key :summary, "Find User"
      key :description, "Find User"
      key :tags, ["Users"]

      parameter do 
        key :name, :id
        key :description, "User's Id"
        key :in, :path
        key :type, :integer
      end

      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "error"
      end
    end
  end


  def show
    @user = User.find(params[:id])
    render json: @user
  end


  #user update

  swagger_path "/users/{id}" do 
    operation :put do 
      key :summary, "Update User"
      key :description, "Update User"
      key :tags, ["Users"]

      parameter do 
        key :name, :id
        key :in, :path
        key :type, :integer
        key :description, "ID"
      end

      parameter do 
        key :name, :email
        key :in, :formData
        key :description, "Email"
      end

      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "Error"
      end

    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(email: params[:email])
      render json: @user
    end
  end


  #destroy user api

  swagger_path "/users/{id}" do
    operation :delete do 
      key :summary, "Delete User"
      key :description, "Delete User"
      key :tags, ["Users"]

      parameter do 
        key :name, :id
        key :type, :integer
        key :description, "Id"
        key :in, :path
      end

      response 200 do 
        key :description, "Success"
      end

      response 400 do 
        key :description, "Error"
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user
    end
  end





  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end



end
