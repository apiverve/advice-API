import Foundation

/// Error types for Advice Generator
public enum AdviceGeneratorAPIError: Error, LocalizedError {
    case invalidURL
    case invalidParameters
    case networkError(Error)
    case invalidResponse
    case noData
    case httpError(statusCode: Int)
    case apiError(statusCode: Int, message: String)
    case decodingError(Error)

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid API URL"
        case .invalidParameters:
            return "Invalid request parameters"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid server response"
        case .noData:
            return "No data received from server"
        case .httpError(let statusCode):
            return "HTTP error with status code: \(statusCode)"
        case .apiError(let statusCode, let message):
            return "API error (\(statusCode)): \(message)"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }

    public var statusCode: Int? {
        switch self {
        case .httpError(let code), .apiError(let code, _):
            return code
        default:
            return nil
        }
    }

    public var isAuthenticationError: Bool {
        if case .apiError(let code, _) = self, code == 401 || code == 403 {
            return true
        }
        return false
    }

    public var isRateLimitError: Bool {
        if case .apiError(let code, _) = self, code == 429 {
            return true
        }
        return false
    }

    public var isServerError: Bool {
        if case .apiError(let code, _) = self, code >= 500 {
            return true
        }
        return false
    }
}
