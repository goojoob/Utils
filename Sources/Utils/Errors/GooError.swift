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

    public var title: LocalizedStringKey
    public var desc: LocalizedStringKey
    public var dismissButton: LocalizedStringKey
    public var error: ErrorType
    public var alert: Bool

    public init() {
        title = "error_generic_title"
        desc = "error_generic_descr"
        dismissButton = "error_dismissButton"
        error = .noError
        alert = false
    }

    public init(title: LocalizedStringKey,
                desc: LocalizedStringKey,
                dismissButton: LocalizedStringKey,
                error: ErrorType,
                alert: Bool) {
        self.title = title
        self.desc = desc
        self.dismissButton = dismissButton
        self.error = error
        self.alert = alert
    }
}
