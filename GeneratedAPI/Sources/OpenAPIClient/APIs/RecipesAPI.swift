//
// RecipesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class RecipesAPI {

    /**
     Retrieve empty recipes data
     
     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: GetRecipes200Response
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getEmptyRecipes(openAPIClient: OpenAPIClient = OpenAPIClient.shared) async throws(ErrorResponse) -> GetRecipes200Response {
        return try await getEmptyRecipesWithRequestBuilder(openAPIClient: openAPIClient).execute().body
    }

    /**
     Retrieve empty recipes data
     - GET /recipes-empty.json

     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<GetRecipes200Response> 
     */
    open class func getEmptyRecipesWithRequestBuilder(openAPIClient: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<GetRecipes200Response> {
        let localVariablePath = "/recipes-empty.json"
        let localVariableURLString = openAPIClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetRecipes200Response>.Type = openAPIClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false, openAPIClient: openAPIClient)
    }

    /**
     Retrieve malformed recipes data
     
     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: GetRecipes200Response
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getMalformedRecipes(openAPIClient: OpenAPIClient = OpenAPIClient.shared) async throws(ErrorResponse) -> GetRecipes200Response {
        return try await getMalformedRecipesWithRequestBuilder(openAPIClient: openAPIClient).execute().body
    }

    /**
     Retrieve malformed recipes data
     - GET /recipes-malformed.json

     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<GetRecipes200Response> 
     */
    open class func getMalformedRecipesWithRequestBuilder(openAPIClient: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<GetRecipes200Response> {
        let localVariablePath = "/recipes-malformed.json"
        let localVariableURLString = openAPIClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetRecipes200Response>.Type = openAPIClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false, openAPIClient: openAPIClient)
    }

    /**
     Retrieve a list of recipes
     
     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: GetRecipes200Response
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getRecipes(openAPIClient: OpenAPIClient = OpenAPIClient.shared) async throws(ErrorResponse) -> GetRecipes200Response {
        return try await getRecipesWithRequestBuilder(openAPIClient: openAPIClient).execute().body
    }

    /**
     Retrieve a list of recipes
     - GET /recipes.json

     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<GetRecipes200Response> 
     */
    open class func getRecipesWithRequestBuilder(openAPIClient: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<GetRecipes200Response> {
        let localVariablePath = "/recipes.json"
        let localVariableURLString = openAPIClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetRecipes200Response>.Type = openAPIClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false, openAPIClient: openAPIClient)
    }
}
