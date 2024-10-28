
import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    
    func makeUIView(context: Context) -> some UIView {
        let animationView: LottieAnimationView = .init()
        let view = UIView(frame: .zero)
        
        LottieAnimation.loadedFrom(url: URL(string: animationName)!, closure: { animation in
            animationView.animation = animation
            animationView.loopMode = .loop
            animationView.play()
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)
            
            NSLayoutConstraint.activate([
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
        }, animationCache: DefaultAnimationCache.sharedCache)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
