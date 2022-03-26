import Foundation

extension String {

    var protectQuotation: String {
        self.replacingOccurrences(of: "\"", with: "\\\"")
    }

}
