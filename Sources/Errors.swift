import Foundation

//===

public
protocol APIClientError: Error {}

//===

struct InvalidBasePath: APIClientError
{
    let basePath: String
}

//===

struct InvalidRelativePath: APIClientError
{
    let basePath: String
    let relativePath: String
}

//===

struct ParameterEncodingFailed: APIClientError
{
    let reason: String
    let error: Error?
}