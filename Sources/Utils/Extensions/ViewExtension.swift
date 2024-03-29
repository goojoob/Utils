import SwiftUI

#if !os(macOS)

@available(iOS 15.0, *)
extension View {
    public func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#endif
