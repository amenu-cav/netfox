import Foundation
import SwiftUI

struct TestScreen7View: View {
    @State private var isRealTimeAntivirusOn = false
    @State private var isBackgroundScanOn = false
    @State private var isSecurityOn = false
    @State private var isPasswordsOn = false
    @State private var isCacheOn = false
    @State private var isSubscriptionActive = true
    @State private var isProtect = false

    var body: some View {
        VStack() {
            Text(isProtect ? "Protection on!" : "Protection off!")
                .font(.system(size: Constants.smallScreen ? 26 : 33, weight: .bold, design: .default))
                .foregroundStyle(.black)
                .padding(.top, Constants.smallScreen ? 5 : 50)
            
            Text(isProtect ? "You can relax and close the app. Your device is safe as long as your subscription is active" : "Enable all services to customize\nyour phone's protection!")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(Color(red: 156/255, green: 156/255, blue: 156/255))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            ZStack {
                if isProtect {
                    LottieView(animationName: "ScanLottie1", loopMode: .loop) //Тут нужную лотти поставить надо 
                        .frame(width: Constants.smallScreen ? 230 : 260, height: Constants.smallScreen ? 230 : 260)
                } else {
                    Circle()
                        .fill(Color(red: 234/255, green: 247/255, blue: 238/255))
                        .frame(width: Constants.smallScreen ? 230 : 260, height: Constants.smallScreen ? 230 : 260)
                }
                
                Circle()
                    .fill(isProtect ? .white : Color(red: 255/255, green: 193/255, blue: 194/255))
                    .frame(width: Constants.smallScreen ? 190 : 210, height: Constants.smallScreen ? 190 : 210)
                
                Circle()
                    .trim(from: 0, to: circleProgress())
                    .stroke(Color.green, lineWidth: 6)
                    .rotationEffect(.degrees(-90))
                    .frame(width: Constants.smallScreen ? 190 : 210, height: Constants.smallScreen ? 190 : 210)
                    .animation(.easeInOut(duration: 0.5), value: circleProgress())

                VStack {
                    Image(isProtect ? "Screen7GreenImg" : "Screen7Rtiangle")
                        .frame(width: 58, height: 58)
                    
                    Text(isProtect ? "You're\nProtected" : "You're not\nProtected")
                        .font(.system(size: Constants.smallScreen ? 20 : 26, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)

                    Text("WebShield is ")
                        .font(.system(size: Constants.smallScreen ? 12 : 14, weight: .medium, design: .default))
                        .foregroundColor(Color(red: 103/255, green: 103/255, blue: 103/255)) +
                    Text(isProtect ? "ON" : "OFF")
                        .font(.system(size: Constants.smallScreen ? 12 : 14, weight: .bold, design: .default))
                        .foregroundColor(isProtect ? .green : .red)
                }
            }
            .padding(.vertical)

            TestScreen7SecurityCenterView(isSubscriptionActive: $isSubscriptionActive,
                                          isRealTimeAntivirusOn: $isRealTimeAntivirusOn,
                                          isBackgroundScanOn: $isBackgroundScanOn,
                                          isSecurityOn: $isSecurityOn,
                                          isPasswordsOn: $isPasswordsOn,
                                          isCacheOn: $isCacheOn)
                .padding(.horizontal)
            
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
    }
    
    func circleProgress() -> CGFloat {
        let togglesOn = [isSubscriptionActive, isRealTimeAntivirusOn, isBackgroundScanOn, isSecurityOn, isPasswordsOn, isCacheOn].filter { $0 }.count
        
        let result = CGFloat(togglesOn) / 6
        
        DispatchQueue.main.async {
            isProtect = result == 1
        }
        
        return result
    }
}


