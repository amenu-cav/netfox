
import Foundation
import SwiftUI

@MainActor
struct Constants {
    static let smallScreen = UIScreen.main.nativeBounds.height <= 1334
    static let ProMaxScreen = UIScreen.main.nativeBounds.height >= 2688 // 11 Pro Max and bigger
    static let retroScreen = UIScreen.main.nativeBounds.height <= 1333  // iphone SE 1st gen
    static let oldScreen = UIScreen.main.nativeBounds.height == 1334    // iPhone SE 3rd gen
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}
