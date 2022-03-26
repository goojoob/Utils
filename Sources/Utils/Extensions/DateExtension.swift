import Foundation

@available(macOS 12.0, *)
@available(iOS 15.0, *)
extension Date {

    public var monthYear: String {
        return self.formatted(.dateTime.year().month(.wide))
    }

    public var stringValue: String {
        return self.formatted(.dateTime.year().month().day())
    }

}
