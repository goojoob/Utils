import SwiftUI

@available(macOS 12.0, *)
@available(iOS 15.0, *)
public struct GooError: Error {

    enum ErrorType {
        case fatal
        case regular
        case warning
        case noError
    }

    var title: LocalizedStringKey = "error_generic_title"
    var desc: LocalizedStringKey = "error_generic_descr"
    var dismissButton: LocalizedStringKey = "error_dismissButton"
    var error: ErrorType = .noError
    var alert: Bool = false

}
