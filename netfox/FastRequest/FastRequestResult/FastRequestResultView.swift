import Foundation
import SwiftUI
import ScreenShield

public struct FastRequestResultView: View {
    @AppStorage("isRealTimeAntivirusOn") private var isRealTimeAntivirusOn = false
    @AppStorage("isBackgroundScanOn") private var isBackgroundScanOn = false
    @AppStorage("isSecurityOn") private var isSecurityOn = false
    @AppStorage("isPasswordsOn") private var isPasswordsOn = false
    @AppStorage("isCacheOn") private var isCacheOn = false
    @AppStorage("isSheetAnti") private var isSheetAnti = false
    @Binding var isDisabled: Bool
    @Binding var isSubscriptionActive: Bool
    @State private var isProtect = false
    @State private var showSheetView = false
    @State private var showingSheet = false
    @State private var showStatistics = false
    @State var showDeepScreen: Bool = false
    
    private let model: AuthorizationOfferModel?
    private let currentTariff: String?
    private let completion: ((EventsTitles?) -> Void)?
    
    public init(isDisabled: Binding<Bool>, isSubscriptionActive: Binding<Bool>, model: AuthorizationOfferModel?, currentTariff: String?, completion: ((EventsTitles?) -> Void)?) {
        self._isSubscriptionActive = isSubscriptionActive
        self.model = model
        self.currentTariff = currentTariff
        self.completion = completion
        self._isDisabled = isDisabled
    }
    
    public var body: some View {
        if !NFX.sharedInstance().isShow {
            myView()
                .background(.white)
                .navigationBarHidden(true)
                .sheet(isPresented: $showingSheet) {
                    SuperRequestView(isDisabled: $isDisabled, currentTariff: currentTariff, completion: completion)
                }
                .protectScreenshot()
                .ignoresSafeArea(.all)
                .onAppear {
                    completion?(.specialOffer5Show)
                    ScreenShield.shared.protectFromScreenRecording()
                }
                .fullScreenCover(isPresented: $showDeepScreen) {
                    if let objOne = model?.gap?.objecs[0], let objTwo = model?.gap?.objecs[4] {
//                        InterScreen(showNextScreen: .constant(false), isDisabled: $isDisabled, model: model, currentTariff: currentTariff, scanObject: obj, scanTitle: model?.gap?.title ?? "", secureScreenNumber: model?.gap?.orderIndex ?? 0, completion: completion)
                        InterScreen(showNextScreen: .constant(false),
                                    isDisabled: $isDisabled,
                                    model: model,
                                    currentTariff: currentTariff ?? "",
                                    scanObject: isSubscriptionActive ? objTwo : objOne,
                                    scanTitle: isSubscriptionActive ? (model?.gap?.titleDeep ?? "") : (model?.gap?.title ?? ""),
                                    secureScreenNumber: 1/*isSubscriptionActive ? 4 : 0*/,
                                    completion: completion!)
                    }
                }
        } else {
            myView()
                .background(.white)
                .navigationBarHidden(true)
                .sheet(isPresented: $showingSheet) {
                    SuperRequestView(isDisabled: $isDisabled, currentTariff: currentTariff, completion: completion)
                }
                .onAppear {
                    completion?(.specialOffer5Show)
                }
                .fullScreenCover(isPresented: $showDeepScreen) {
                    if let objOne = model?.gap?.objecs[0], let objTwo = model?.gap?.objecs[4] {
//                        InterScreen(showNextScreen: .constant(false), isDisabled: $isDisabled, model: model, currentTariff: currentTariff, scanObject: obj, scanTitle: model?.gap?.title ?? "", secureScreenNumber: model?.gap?.orderIndex ?? 0, completion: completion)
                        InterScreen(showNextScreen: .constant(false),
                                    isDisabled: $isDisabled,
                                    model: model,
                                    currentTariff: currentTariff ?? "",
                                    scanObject: isSubscriptionActive ? objTwo : objOne,
                                    scanTitle: isSubscriptionActive ? (model?.gap?.titleDeep ?? "") : (model?.gap?.title ?? ""),
                                    secureScreenNumber: isSubscriptionActive ? 4 : 0,
                                    completion: completion!)
                    }
                }
        }
    }
    
    @MainActor
    private func myView() -> some View {
        ZStack {
            ZStack {
                VStack() {
                    Text(isProtect ? String(format: model?.scn?.title_compl ?? "", localizeText(forKey: .subsOn)) : String(format: model?.scn?.title_compl ?? "", localizeText(forKey: .subsDis)))
                        .font(.system(size: Constants.smallScreen ? 22 : 33, weight: .bold, design: .default))
                        .foregroundStyle(.black)
                        .padding(.top, Constants.smallScreen ? 5 : 50)
                    
                    Text(isProtect ? model?.scn?.subtitle_compl ?? "" : model?.scn?.subtitle_unp ?? "")
                        .font(.system(size: Constants.smallScreen ? 14 : 16, weight: .medium, design: .default))
                        .foregroundStyle(Color(red: 156/255, green: 156/255, blue: 156/255))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    ZStack {
                        if isProtect {
                            LottieView(animationName: model?.scn?.anim_done ?? "")
                                .frame(width: Constants.smallScreen ? 200 : 260, height: Constants.smallScreen ? 200 : 260)
                        } else {
                            Circle()
                                .fill(Color(red: 234/255, green: 247/255, blue: 238/255))
                                .frame(width: Constants.smallScreen ? 200 : 260, height: Constants.smallScreen ? 200 : 260)
                        }
                        
                        Circle()
                            .fill(isProtect ? .clear : Color(red: 255/255, green: 193/255, blue: 194/255))
                            .frame(width: Constants.smallScreen ? 160 : 210, height: Constants.smallScreen ? 160 : 210)
                        
                        Circle()
                            .trim(from: 0, to: circleProgress())
                            .stroke(Color.green, lineWidth: 6)
                            .rotationEffect(.degrees(-90))
                            .frame(width: Constants.smallScreen ? 160 : 210, height: Constants.smallScreen ? 160 : 210)
                            .animation(.easeInOut(duration: 0.5), value: circleProgress())
                        
                        VStack {
                            Image(isProtect ? .screen7GreenImg : .screen7Rtiangle)
                                .frame(width: 58, height: 58)
                            
                            Text(isProtect ? model?.scn?.title_anim_compl ?? "" : model?.scn?.title_anim_unp ?? "")
                                .font(.system(size: Constants.smallScreen ? 20 : 23, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            Text(createAtrStr())
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.vertical)
                    .onTapGesture {
                        showDeepScreen = true
                    }
                    
                    FastRequestResultSecurityCenterView(
                        isSubscriptionActive: $isSubscriptionActive,
                        isRealTimeAntivirusOn: $isRealTimeAntivirusOn,
                        isBackgroundScanOn: $isBackgroundScanOn,
                        isSecurityOn: $isSecurityOn,
                        isPasswordsOn: $isPasswordsOn,
                        isCacheOn: $isCacheOn,
                        isSheetAnti: $isSheetAnti,
                        showStatistics: $showStatistics,
                        completion: completion,
                        model: model
                    ) { isTariif in
                        if isTariif {
                            showingSheet = true
                        } else {
                            showSheetView = true
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                if showSheetView {
                    SheetView(showSheetView: $showSheetView, isSheetAnti: $isSheetAnti, model: model?.sheet, completion: completion)
                }
            }
            
            if showStatistics {
                StatisticsPopupView(
                    isPresented: $showStatistics,
                    title: model?.scn?.stats?.statBtnTitle ?? "",
                    titleIcon: model?.scn?.stats?.statImg ?? "",
                    subtitle: model?.scn?.stats?.statBtnSubtitle ?? "",
                    statistics: [
                        StatisticItem(
                            icon: model?.scn?.stats?.statScnImg1 ?? "",
                            title: model?.scn?.stats?.statScnTitle1 ?? "",
                            value: model?.scn?.stats?.statScnSubtitle1 ?? "",
                            iconColor: .orange
                        ),
                        StatisticItem(
                            icon: model?.scn?.stats?.statScnIcon2 ?? "",
                            title: model?.scn?.stats?.statScnText2 ?? "",
                            value: model?.scn?.stats?.statScnCount2 ?? "",
                            iconColor: .red
                        ),
                        StatisticItem(
                            icon: model?.scn?.stats?.statScnIcon3 ?? "",
                            title: model?.scn?.stats?.statScnText3 ?? "",
                            value: model?.scn?.stats?.statScnCount3 ?? "",
                            iconColor: .gray
                        ),
                        StatisticItem(
                            icon: model?.scn?.stats?.statScnIcon4 ?? "",
                            title: model?.scn?.stats?.statScnText4 ?? "",
                            value: model?.scn?.stats?.statScnCount4 ?? "",
                            iconColor: .brown
                        ),
                        StatisticItem(
                            icon: model?.scn?.stats?.statScnIcon5 ?? "",
                            title: model?.scn?.stats?.statScnText5 ?? "",
                            value: model?.scn?.stats?.statScnCount5 ?? "",
                            iconColor: .green
                        )
                    ],
                    closeButtonTitle: model?.scn?.stats?.cls ?? ""
                )
                .transition(.opacity)
            }
        }
    }
    
    private func circleProgress() -> CGFloat {
        let antivirusBool = NFX.sharedInstance().isSheet ? isSheetAnti : isRealTimeAntivirusOn
        let togglesOn = [isSubscriptionActive, antivirusBool, isBackgroundScanOn, isSecurityOn, isPasswordsOn, isCacheOn].filter { $0 }.count
        let result = CGFloat(togglesOn) / 6
        
        DispatchQueue.main.async {
            isProtect = result == 1
        }
        
        return result
    }
    
    private func createAtrStr() -> AttributedString {
//        let attributedStrOne = NSMutableAttributedString(string: String(model?.scn?.subtitle_anim_compl?.dropLast(2) ?? ""), attributes: [
//            NSAttributedString.Key.foregroundColor: UIColor().hexStringToUIColor(hex: "#000000"),
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11, weight: .medium)
//        ])
//        let attributedStrTwo = NSMutableAttributedString(string: localizeText(forKey: isProtect ? .subsActive : .subsOff).uppercased(), attributes: [
//            NSAttributedString.Key.foregroundColor: UIColor().hexStringToUIColor(hex: isProtect ? "#65D65C" : "#E74444"),
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold)
//        ])
//        
//        attributedStrOne.append(attributedStrTwo)
//        
//        return AttributedString(attributedStrOne)
        let attributedStrOne = NSMutableAttributedString(string: String((model?.scn?.subtitle_anim_compl?.dropLast(2) ?? "") + "\n"), attributes: [
            NSAttributedString.Key.foregroundColor: UIColor().hexStringToUIColor(hex: "#000000"),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11, weight: .medium)
        ])

        let attributedStrTwo = NSMutableAttributedString(string:  model?.gap?.titleDeep?.uppercased() ?? "", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor().hexStringToUIColor(hex: "#65D65C"),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold)
        ])
        
        attributedStrOne.append(attributedStrTwo)
        
        return AttributedString(attributedStrOne)
    }
}

extension UIColor {
    func hexStringToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

func localizeText(forKey key: KeyForLocale) -> String {
    let bundle = Bundle.module
    
    var result = bundle.localizedString(
        forKey: key.rawValue,
        value: nil,
        table: nil
    )
    
    if result == key.rawValue {
        result = Bundle.module.localizedString(
            forKey: key.rawValue,
            value: nil,
            table: "Localizable"
        )
    }
    
    return result
}

enum KeyForLocale: String  {
    case now
    case subsOff
    case subsOn
    case subsPrice
    case subsTitle
    case subsSub
    case subsCancel
    case subsBuy
    case subsDis
    case subsActive
    case alertText
}
