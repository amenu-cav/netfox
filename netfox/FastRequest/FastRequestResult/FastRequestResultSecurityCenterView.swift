import Foundation
import SwiftUI

struct FastRequestResultSecurityCenterView: View {
    @Binding var isSubscriptionActive: Bool
    @Binding var isRealTimeAntivirusOn: Bool
    
    @Binding var isBackgroundScanOn: Bool
    @Binding var isSecurityOn: Bool
    
    @Binding var isPasswordsOn: Bool
    @Binding var isCacheOn: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(5)
                        .frame(width: 70, height: 70)
                    
                    Image("Screen4Icon")
                }
                
                VStack(alignment: .leading) {
                    Text("Security Center")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                    
                    Text("Fully protect your iPhone from \nviruses and threats 24/7")
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundStyle(Color(red: 156/255, green: 156/255, blue: 156/255))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .padding(.leading, 7)
                
                Spacer()
            }
            .padding(.all, 5)
            .background(Color(red: 250/255, green: 250/255, blue: 250/255))
            .cornerRadius(10)
            
            VStack {
                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: "Subscription:",
                                          activeTitle: "Active",
                                          disactiveTitle: "Inactive",
                                          backColor: .white,
                                          isToggleActive: $isSubscriptionActive)
                    
                    FastRequestResultToggleView(title: "Real-time antivirus:",
                                          activeTitle: "Active",
                                          disactiveTitle: "Inactive",
                                          backColor: .white,
                                          isToggleActive: $isRealTimeAntivirusOn)
                }
                
                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: "Background Scan:",
                                          activeTitle: "Active",
                                          disactiveTitle: "Inactive",
                                          backColor: .white,
                                          isToggleActive: $isBackgroundScanOn)
                    
                    FastRequestResultToggleView(title: "Security:",
                                          activeTitle: "Protected",
                                          disactiveTitle: "Unprotect",
                                          backColor: .white,
                                          isToggleActive: $isSecurityOn)
                }
                
                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: "Privacy:",
                                          activeTitle: "Guarded",
                                          disactiveTitle: "Unprotect",
                                          backColor: .white,
                                          isToggleActive: $isPasswordsOn)
                    
                    FastRequestResultToggleView(title: "Performance:",
                                          activeTitle: "Optimized",
                                          disactiveTitle: "Inactive",
                                          backColor: .white,
                                          isToggleActive: $isCacheOn)
                }
            }
        }
        .padding(.all, 5)
        .background(Color(red: 239/255, green: 239/255, blue: 239/255))
        .cornerRadius(15)
    }
}
