import Foundation

extension String {

    public var protectQuotation: String {
        self.replacingOccurrences(of: "\"", with: "\\\"")
    }

}

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}