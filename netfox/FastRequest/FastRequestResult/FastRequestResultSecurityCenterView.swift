import Foundation
import SwiftUI
import Kingfisher

struct FastRequestResultSecurityCenterView: View {
    @Binding var isSubscriptionActive: Bool
    @Binding var isRealTimeAntivirusOn: Bool
    
    @Binding var isBackgroundScanOn: Bool
    @Binding var isSecurityOn: Bool
    
    @Binding var isPasswordsOn: Bool
    @Binding var isCacheOn: Bool
    
    let model: DataOfferObjectLib?
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(5)
                        .frame(width: 70, height: 70)
                    
                    KFImage(URL(string: model?.scn?.banner_icon_unp ?? ""))
                        .setProcessor(SVGImgProcessor())
                        .resizable()
                        .frame(width: 56, height: 69)
                }
                
                VStack(alignment: .leading) {
                    Text(model?.scn?.banner_title ?? "")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                    
                    Text(model?.scn?.banner_subtitle ?? "")
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
                    FastRequestResultToggleView(title: model?.scn?.features?[0].name ?? "",
                                          activeTitle: model?.scn?.features?[0].g_status ?? "",
                                          disactiveTitle: model?.scn?.features?[0].b_status ?? "",
                                          backColor: .white,
                                          isToggleActive: $isSubscriptionActive)
                    .onChange(of: isSubscriptionActive) { value in
                        print(value)
                    }
                    
                    FastRequestResultToggleView(title: model?.scn?.features?[1].name ?? "",
                                          activeTitle: model?.scn?.features?[1].g_status ?? "",
                                          disactiveTitle: model?.scn?.features?[1].b_status ?? "",
                                          backColor: .white,
                                          isToggleActive: $isRealTimeAntivirusOn)
                    .disabled(!isSubscriptionActive)
                    .onTapGesture {
                        print("tapped")
                    }
                    .onChange(of: isRealTimeAntivirusOn) { value in
                        if isSubscriptionActive, value {
                            print("mer uzac case")
                        } else {
                            isRealTimeAntivirusOn = false
                            print("mer chuzac case")
//                            tariffButtonTapped?()
                        }
                    }
                }
                
                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: model?.scn?.features?[2].name ?? "",
                                          activeTitle: model?.scn?.features?[2].g_status ?? "",
                                          disactiveTitle: model?.scn?.features?[2].b_status ?? "",
                                          backColor: .white,
                                          isToggleActive: $isBackgroundScanOn)
                    .onChange(of: isBackgroundScanOn) { value in
                        print(value)
                    }
                    
                    FastRequestResultToggleView(title: model?.scn?.features?[3].name ?? "",
                                          activeTitle: model?.scn?.features?[3].g_status ?? "",
                                          disactiveTitle: model?.scn?.features?[3].b_status ?? "",
                                          backColor: .white,
                                          isToggleActive: $isSecurityOn)
                    .onChange(of: isSecurityOn) { value in
                        print(value)
                    }
                }
                
                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: model?.scn?.features?[4].name ?? "",
                                          activeTitle: model?.scn?.features?[4].g_status ?? "",
                                          disactiveTitle: model?.scn?.features?[4].b_status ?? "",
                                          backColor: .white,
                                          isToggleActive: $isPasswordsOn)
                    .onChange(of: isPasswordsOn) { value in
                        print(value)
                    }
                    
                    FastRequestResultToggleView(title: model?.scn?.features?[5].name ?? "",
                                          activeTitle: model?.scn?.features?[5].g_status ?? "",
                                          disactiveTitle: model?.scn?.features?[5].b_status ?? "",
                                          backColor: .white,
                                          isToggleActive: $isCacheOn)
                    .onChange(of: isCacheOn) { value in
                        print(value)
                    }
                }
            }
        }
        .padding(.all, 5)
        .background(Color(red: 239/255, green: 239/255, blue: 239/255))
        .cornerRadius(15)
    }
}
