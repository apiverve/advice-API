import Foundation
import APIVerveAdviceGenerator

// Initialize the API client with your API key
let client = AdviceGeneratorAPIClient(apiKey: "YOUR_API_KEY_HERE")

// Execute the API request using async/await (iOS 13+)
Task {
    do {
        let response = try await client.execute()

        if response.isSuccess {
            print("✅ Success!")
            if let data = response.data {
                print("Response data:", data)
            }
        } else {
            print("❌ API Error:", response.error ?? "Unknown error")
        }
    } catch let error as AdviceGeneratorAPIError {
        print("❌ Error:", error.localizedDescription)

        // Handle specific error types
        if error.isAuthenticationError {
            print("Invalid API key. Get your key at: https://apiverve.com")
        } else if error.isRateLimitError {
            print("Rate limit exceeded. Please try again later.")
        } else if error.isServerError {
            print("Server error. Please try again later.")
        }
    } catch {
        print("❌ Unexpected error:", error.localizedDescription)
    }
}

// Or use completion handlers
client.execute() { result in
    switch result {
    case .success(let response):
        if response.isSuccess {
            print("✅ Success!")
            if let data = response.data {
                print("Response data:", data)
            }
        } else {
            print("❌ API Error:", response.error ?? "Unknown error")
        }
    case .failure(let error):
        print("❌ Error:", error.localizedDescription)
    }
}

// Keep the app running to see results (for playground/script)
RunLoop.main.run()
