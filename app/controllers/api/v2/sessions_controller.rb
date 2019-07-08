class Api::V2::SessionsController < ApplicationController 
  include Swagger::Blocks



  #creating session 

  swagger_path "/sessions" do 
    operation :post do 
      key :summmary, "User Session Create"
      key :description, "User Session Create"
      key :tags, ["Sessions"]

      parameter do 
        key :name, :email
        key :in, :formData
        key :description, "Email"
      end

      parameter do 
        key :name, :password
        key :in, :formData
        key :format, :password
        key :description, "Email"
      end

      response 200 do 
        key :descriptionm, "Successfully Estalished Session"
      end

      response 400 do
        key :description, "Error While Creating Session"
      end
    end
  end



  def create
    @user = User.find_for_authentication(email: params[:email])
    if @user.valid_password?(params[:password])
      jwt = JWT.encode({user_id: @user.id, exp: (Time.now + 2.weeks).to_i, email: @user.email}, Rails.application.secrets.secret_key_base, 'HS256')
      p jwt
      render :create, status: :created, locals: {token: jwt}
    end
  end

  #api for destroying session

  swagger_path "/sessions/{id}" do 
    operation :delete do 
      key :summmary, "Destroy Session"
      key :description, "Destroy Session"
      key :tags, ["Sessions"]

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
        key :descriptionm, "Error"
      end
    end
  end

  def destroy
  end


end
