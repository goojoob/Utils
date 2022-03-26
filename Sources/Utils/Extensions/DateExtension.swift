import Foundation

@available(macOS 12.0, *)
extension Date {

    var monthYear: String {
        return self.formatted(.dateTime.year().month(.wide))
    }

    var stringValue: String {
        return self.formatted(.dateTime.year().month().day())
    }

}
