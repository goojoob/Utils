import Foundation

extension String {

    public var protectQuotation: String {
        self.replacingOccurrences(of: "\"", with: "\\\"")
    }

}
