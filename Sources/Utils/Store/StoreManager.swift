//
//  File.swift
//  
//
//  Created by Antonio Rodriguez Cia on 26/11/22.
//

import StoreKit

@available(macOS 12.0, *)
@available(iOS 15.0, *)
class StoreManager: NSObject, ObservableObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    @Published var myProducts: [SKProduct] = [SKProduct]()
    @Published var transactionState: SKPaymentTransactionState?
    var request: SKProductsRequest!
    var lastBuy: Int = 0
    var productsStore: [String: Int] = [:]

    init(products: [String: Int]) {
        super.init()

        productsStore = products
        self.getProducts(productIDs: productsStore.map { $0.key })
        SKPaymentQueue.default().add(self)
    }

    // FETCH PRODUCTS

    func getProducts(productIDs: [String]) {
        print("StoreManager - Start requesting products ...")
        let request = SKProductsRequest(productIdentifiers: Set(productIDs))
        request.delegate = self
        request.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("StoreManager - Fetching products: Did receive response")

        if response.products.isNotEmpty {
            for fetchedProduct in response.products {
                DispatchQueue.main.async {
                    print(  """
                            StoreManager - Fetching '\(fetchedProduct.localizedTitle)'
                            \t'\(fetchedProduct.localizedDescription)'
                            \t\(fetchedProduct.localizedPrice ?? "0")
                            """
                    )
                    self.myProducts.append(fetchedProduct)
                }
            }
        }

        for invalidIdentifier in response.invalidProductIdentifiers {
            print("StoreManager - Invalid identifiers found: \(invalidIdentifier)")
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("StoreManager - Request did fail: \(error)")
    }

    // PAY PRODUCT

    func purchaseProduct(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        } else {
            print("StoreManager - User can't make payment.")
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                transactionState = .purchasing
            case .purchased:
                queue.finishTransaction(transaction)
                transactionState = .purchased
                lastBuy = productsStore[transaction.payment.productIdentifier] ?? 0
            case .restored:
                queue.finishTransaction(transaction)
                transactionState = .restored
                lastBuy = productsStore[transaction.payment.productIdentifier] ?? 0
            case .failed, .deferred:
                print("StoreManager - Payment Queue Error: \(String(describing: transaction.error))")
                queue.finishTransaction(transaction)
                transactionState = .failed
            default:
                queue.finishTransaction(transaction)
            }
        }
    }

    // RESTORE PRODUCT

    func restoreProducts() {
        print("StoreManager - Restoring products ...")
        SKPaymentQueue.default().restoreCompletedTransactions()
    }

}
