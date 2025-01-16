import Foundation
import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
//    var backgroundColor: Color = Color("progressBackground")
    var backgroundColor: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
//    var foregroundColor: Color = Color("progressForeground")
    var foregroundColor: Color = Color(red: 0/255, green: 122/255, blue: 255/255)
    var animationDuration: Double = 0.5
    var maxValue = 1
    var onProgress: ((CGFloat) -> Void) = { progress in }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(backgroundColor)
                        .frame(height: proxy.size.height)
                    
                    Capsule()
                        .fill(foregroundColor)
                        .frame(
                            width: proxy.size.width * (progress / 100),
                            height: proxy.size.height
                        )
                        .animation(.easeInOut(duration: animationDuration), value: progress)
                        .onChange(of: progress) { newValue in
                            onProgress(newValue)
                        }
                }
            }
        }
    }
}
