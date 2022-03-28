import SwiftUI

@available(macOS 12.0, *)
@available(iOS 15.0, *)
public struct GooError: Error {

    public enum ErrorType {
        case fatal
        case regular
        case warning
        case noError
    }

    public var title: LocalizedStringKey = "error_generic_title"
    public var desc: LocalizedStringKey = "error_generic_descr"
    public var dismissButton: LocalizedStringKey = "error_dismissButton"
    public var error: ErrorType = .noError
    public var alert: Bool = false

}
