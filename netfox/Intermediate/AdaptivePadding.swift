import Foundation

struct AdaptivePadding {
    static func getPadding(
        for paddingType: PaddingType,
        width: CGFloat
    ) -> CGFloat {
        return paddingType.padding(width: width)
    }
}

enum PaddingType {
    case titleTopPadding
    case spacing
}

private extension PaddingType {
    func padding(width: CGFloat) -> CGFloat {
        return switch self {
        case .titleTopPadding:
            if isIpad(width: width) {
                84
            } else {
                34
            }
            
        case .spacing:
            if isIpad(width: width) {
                23
            } else {
                15
            }
        }
    }
    
    func isIpad(width: CGFloat) -> Bool {
        return width > 600
    }
}
