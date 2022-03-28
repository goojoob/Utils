import Foundation

@available(macOS 12.0, *)
@available(iOS 15.0, *)
extension Date {

    public var complete: String {
        return self.formatted(.dateTime.year().month().day().hour().minute())
    }

    public var monthYear: String {
        return self.formatted(.dateTime.month().year())
    }

    public var dayMonth: String {
        return self.formatted(.dateTime.day().month())
    }

    public var dayMonthYear: String {
        return self.formatted(.dateTime.day().month().year())
    }

    public var year: String {
        return self.formatted(.dateTime.year())
    }

    public var previousYear: Date {
        let yearsToAdd = -1

        var dateComponent = DateComponents()
        dateComponent.year = yearsToAdd

        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }

    public var nextYear: Date {
        let yearsToAdd = 1

        var dateComponent = DateComponents()
        dateComponent.year = yearsToAdd

        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }

    public func dateAfter(days: Int) -> Date {

        var dateComponent = DateComponents()
        dateComponent.day = days

        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }

    public var monthsOfYear: [String] {
        let year: String = self.formatted(.dateTime.year())
        var months: [String] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-yyyy"

        for num in 1...12 {
            months.append(dateFormatter.date(from: "\(num)-\(year)")!.monthYear)
        }

        return months
    }

    static var futureDate: Date {
        Date(timeIntervalSinceNow: 9999999999999)
    }
}
