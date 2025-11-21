# Advice Generator iOS/macOS SDK

Advice Generator is a simple tool for generating random pieces of advice. It returns a random piece of advice.

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)

---

## Installation

### CocoaPods

Add this to your `Podfile`:

```ruby
pod 'APIVerveAdviceGenerator', '~> 1.1.9'
```

Then run:
```bash
pod install
```

---

## Quick Start

### Swift with Async/Await (iOS 13+)

```swift
import APIVerveAdviceGenerator

let client = AdviceGeneratorAPIClient(apiKey: "YOUR_API_KEY")

Task {
    do {
        let parameters: [String: Any] = [
            // Add your parameters here
        ]
        let response = try await client.execute(parameters: parameters)

        if response.isSuccess {
            print("Success:", response.data ?? [:])
        }
    } catch {
        print("Error:", error.localizedDescription)
    }
}
```

### Swift with Completion Handlers

```swift
import APIVerveAdviceGenerator

let client = AdviceGeneratorAPIClient(apiKey: "YOUR_API_KEY")

let parameters: [String: Any] = [
    // Add your parameters here
]

client.execute(parameters: parameters) { result in
    switch result {
    case .success(let response):
        if response.isSuccess {
            print("Success:", response.data ?? [:])
        } else {
            print("API Error:", response.error ?? "Unknown error")
        }
    case .failure(let error):
        print("Error:", error.localizedDescription)
    }
}
```

---

## Error Handling

The SDK provides detailed error handling:

```swift
client.execute(parameters: params) { result in
    switch result {
    case .success(let response):
        // Handle success
        break
    case .failure(let error):
        if error.isAuthenticationError {
            print("Invalid API key")
        } else if error.isRateLimitError {
            print("Rate limit exceeded")
        } else if error.isServerError {
            print("Server error")
        } else {
            print("Error:", error.localizedDescription)
        }
    }
}
```

---

## API Documentation

For detailed API documentation, visit: [https://docs.apiverve.com/ref/advice](https://docs.apiverve.com/ref/advice)

---

## Get Your API Key

Get your API key from [https://apiverve.com](https://apiverve.com)

---

## Support

- **Documentation:** [https://docs.apiverve.com/ref/advice](https://docs.apiverve.com/ref/advice)
- **Issues:** [GitHub Issues](https://github.com/apiverve/advice-api/issues)
- **Email:** hello@apiverve.com

---

## License

This SDK is released under the MIT License. See [LICENSE](LICENSE) for details.

---

## About APIVerve

[APIVerve](https://apiverve.com) provides production-ready REST APIs for developers. Fast, reliable, and easy to integrate.
