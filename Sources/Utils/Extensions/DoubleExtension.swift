import Foundation

extension Double {

    public func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }

    public var round: Double {
        return Double((self * 100).rounded() / 100)

    }

}