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
        tag do
            key :name, 'Article'
            key :description, 'Article Details'
            externalDocs do
                key :description, 'Find more info here'
                key :url, 'https://swagger.io'
            end
        end
        key :host, 'localhost:3000'
        key :basePath, '/api/v2'
        key :consumes, ['application/json', 'multipart/form-data']
        key :produces, ['application/json']
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
        Api::V2::ArticlesController,
        Article,
        # ErrorModel,
        self,
    ].freeze

    def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
end
