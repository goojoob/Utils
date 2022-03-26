import StoreKit

extension SKProduct {

    var localizedPrice: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = priceLocale
        numberFormatter.numberStyle = .currency

        return numberFormatter.string(from: price)
    }

}
