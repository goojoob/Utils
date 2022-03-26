import StoreKit

extension SKProduct {

    public var localizedPrice: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = priceLocale
        numberFormatter.numberStyle = .currency

        return numberFormatter.string(from: price)
    }

}
