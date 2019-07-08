class ApidocsController < ActionController::Base
    include Swagger::Blocks

    
    swagger_root do
        key :swagger, '2.0'
        info do
            key :version, '1.0.0'
            key :title, 'Swagger Demo TradeOff'
            key :description, 'A sample API for usage of Swagger'
            # key :termsOfService, 'http://helloreverb.com/terms/'
            contact do
                key :name, 'Dhara Thacker'
            end
            # license do
            #     key :name, 'MIT'
            # end
        end
        key :host, 'localhost:3000'
        key :basePath, '/api/v2'
        # key :consumes, ['multipart/form-data']
        # key :produces, ['application/json']
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
        #SwaggerController,
        Api::V2::ArticlesController,
        Api::V2::CommentsController,
        Api::V2::UsersController,
        Api::V2::SessionsController,
        Api::V2::PasswordsController,
        User,
        Article,
        # ErrorModel,
        self,
    ].freeze

    def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end


    def swagger_ui
    end

end
