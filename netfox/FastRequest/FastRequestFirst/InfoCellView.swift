

import Foundation
import SwiftUI

struct InfoCellView: View {
    let title: String
    let iconName: ImageResource
    
    var body: some View {
        HStack(spacing: 12) {
            Image(iconName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.leading, 10)
                .padding(.vertical, 10)
            
            Text(title)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 30)
            
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

//public struct DataOfferObjectLib {
//    var imageUrl: String
//    var title: String
//    var subtitle: String
//    var benefitTitle: String
//    var benefitDescriptions: [String]
//    var btnTitle: String
//    var stTitle: String
//    var stSubtitle: String
//    var poText: String
//    var bzz: Bool?
//    var settings: [String]?
//    var settingsIcon: String?
//    var settingsAnimation: String?
//    var settingsTitle: String?
//    var settingsBtnTitle: String?
//    var modalTitle: String?
//    var modalText: String?
//    var modalIcon: String?
//    var modalBtn: String?
//    var pushIcon: String?
//    var pushTitle: String?
//    var pushText: String?
//    var homeTitle: String?
//    var homeSub: String?
//    var homeIcon: String?
//    var scn: ScnObjLib?
//    var prtd: PrtdObjLib?
//    var objectTwo: ObjectTwoLib?
//    var gap: GapLib?
//    var sheet: SheetLib?
//    
//    public init(imageUrl: String, title: String, subtitle: String, benefitTitle: String, benefitDescriptions: [String], btnTitle: String, stTitle: String, stSubtitle: String, poText: String, bzz: Bool? = nil, settings: [String]? = nil, settingsIcon: String? = nil, settingsAnimation: String? = nil, settingsTitle: String? = nil, settingsBtnTitle: String? = nil, modalTitle: String? = nil, modalText: String? = nil, modalIcon: String? = nil, modalBtn: String? = nil, pushIcon: String? = nil, pushTitle: String? = nil, pushText: String? = nil, homeTitle: String? = nil, homeSub: String? = nil, homeIcon: String? = nil, scn: ScnObjLib? = nil, prtd: PrtdObjLib? = nil, objectTwo: ObjectTwoLib? = nil, gap: GapLib? = nil, sheet: SheetLib? = nil) {
//        self.imageUrl = imageUrl
//        self.title = title
//        self.subtitle = subtitle
//        self.benefitTitle = benefitTitle
//        self.benefitDescriptions = benefitDescriptions
//        self.btnTitle = btnTitle
//        self.stTitle = stTitle
//        self.stSubtitle = stSubtitle
//        self.poText = poText
//        self.bzz = bzz
//        self.settings = settings
//        self.settingsIcon = settingsIcon
//        self.settingsAnimation = settingsAnimation
//        self.settingsTitle = settingsTitle
//        self.settingsBtnTitle = settingsBtnTitle
//        self.modalTitle = modalTitle
//        self.modalText = modalText
//        self.modalIcon = modalIcon
//        self.modalBtn = modalBtn
//        self.pushIcon = pushIcon
//        self.pushTitle = pushTitle
//        self.pushText = pushText
//        self.homeTitle = homeTitle
//        self.homeSub = homeSub
//        self.homeIcon = homeIcon
//        self.scn = scn
//        self.prtd = prtd
//        self.objectTwo = objectTwo
//        self.gap = gap
//        self.sheet = sheet
//    }
//}
//
//public struct ObjectTwoLib {
//    let center: CenterLib
//    let dark_blue: DarkBlueLib
//    let description: DescriptionLib
//    
//    public init(center: CenterLib, dark_blue: DarkBlueLib, description: DescriptionLib) {
//        self.center = center
//        self.dark_blue = dark_blue
//        self.description = description
//    }
//    
//    public struct CenterLib {
//        var title    : String?
//        var subtitle: String?
//        var footer_text: String?
//        var res_color: String?
//        var items: [ItemsLib]
//        
//        public init(title: String? = nil, subtitle: String? = nil, footer_text: String? = nil, res_color: String? = nil, items: [ItemsLib]) {
//            self.title = title
//            self.subtitle = subtitle
//            self.footer_text = footer_text
//            self.res_color = res_color
//            self.items = items
//        }
//        
//        public struct ItemsLib {
//            let name: String?
//            let res: String?
//            
//            public init(name: String?, res: String?) {
//                self.name = name
//                self.res = res
//            }
//        }
//    }
//    
//    public struct DarkBlueLib {
//        var subtitle: String?
//        var small_img: String?
//        var title: String?
//        var al_title: String?
//        var al_subtitle: String?
//        var al_subtitle_no_bio: String?
//        var main_img: String?
//        var btn_title: String?
//        var footer_text: String?
//        
//        public init(subtitle: String? = nil, small_img: String? = nil, title: String? = nil, al_title: String? = nil, al_subtitle: String? = nil, al_subtitle_no_bio: String? = nil, main_img: String? = nil, btn_title: String? = nil, footer_text: String? = nil) {
//            self.subtitle = subtitle
//            self.small_img = small_img
//            self.title = title
//            self.al_title = al_title
//            self.al_subtitle = al_subtitle
//            self.al_subtitle_no_bio = al_subtitle_no_bio
//            self.main_img = main_img
//            self.btn_title = btn_title
//            self.footer_text = footer_text
//        }
//    }
//    
//    public struct DescriptionLib {
//        var btn_subtitle_color: String?
//        var subtitle: String?
//        var items_title: String?
//        var title: String?
//        var btn_subtitle: String?
//        var main_img: String?
//        var btn_title: String?
//        var items: [String]?
//        
//        public init(btn_subtitle_color: String? = nil, subtitle: String? = nil, items_title: String? = nil, title: String? = nil, btn_subtitle: String? = nil, main_img: String? = nil, btn_title: String? = nil, items: [String]? = nil) {
//            self.btn_subtitle_color = btn_subtitle_color
//            self.subtitle = subtitle
//            self.items_title = items_title
//            self.title = title
//            self.btn_subtitle = btn_subtitle
//            self.main_img = main_img
//            self.btn_title = btn_title
//            self.items = items
//        }
//    }
//}
//
//public struct ScnObjLib {
//    var title_proc            : String?
//    var subtitle_proc        : String?
//    var title_anim_proc        : String?
//    var subtitle_anim_proc    : String?
//    var title_compl            : String?
//    var subtitle_compl        : String?
//    var title_anim_compl    : String?
//    var subtitle_anim_compl    : String?
//    var title_unp            : String?
//    var subtitle_unp        : String?
//    var title_anim_unp        : String?
//    var subtitle_anim_unp    : String?
//    var banner_title        : String?
//    var banner_subtitle        : String?
//    var banner_icon            : String?
//    var banner_icon_unp        : String?
//    var btn                    : String?
//    var anim_scn            : String?
//    var anim_done            : String?
//    var anim_scn_unp        : String?
//    var anim_done_unp        : String?
//    var rr_title            : String?
//    var rr_subtitle            : String?
//    
//    var features            : [FeaturesLib]?
//    
//    public init(title_proc: String? = nil, subtitle_proc: String? = nil, title_anim_proc: String? = nil, subtitle_anim_proc: String? = nil, title_compl: String? = nil, subtitle_compl: String? = nil, title_anim_compl: String? = nil, subtitle_anim_compl: String? = nil, title_unp: String? = nil, subtitle_unp: String? = nil, title_anim_unp: String? = nil, subtitle_anim_unp: String? = nil, banner_title: String? = nil, banner_subtitle: String? = nil, banner_icon: String? = nil, banner_icon_unp: String? = nil, btn: String? = nil, anim_scn: String? = nil, anim_done: String? = nil, anim_scn_unp: String? = nil, anim_done_unp: String? = nil, rr_title: String? = nil, rr_subtitle: String? = nil, features: [FeaturesLib]? = nil) {
//        self.title_proc = title_proc
//        self.subtitle_proc = subtitle_proc
//        self.title_anim_proc = title_anim_proc
//        self.subtitle_anim_proc = subtitle_anim_proc
//        self.title_compl = title_compl
//        self.subtitle_compl = subtitle_compl
//        self.title_anim_compl = title_anim_compl
//        self.subtitle_anim_compl = subtitle_anim_compl
//        self.title_unp = title_unp
//        self.subtitle_unp = subtitle_unp
//        self.title_anim_unp = title_anim_unp
//        self.subtitle_anim_unp = subtitle_anim_unp
//        self.banner_title = banner_title
//        self.banner_subtitle = banner_subtitle
//        self.banner_icon = banner_icon
//        self.banner_icon_unp = banner_icon_unp
//        self.btn = btn
//        self.anim_scn = anim_scn
//        self.anim_done = anim_done
//        self.anim_scn_unp = anim_scn_unp
//        self.anim_done_unp = anim_done_unp
//        self.rr_title = rr_title
//        self.rr_subtitle = rr_subtitle
//        self.features = features
//    }
//    
//    public struct FeaturesLib {
//        var name    : String?
//        var g_status: String?
//        var b_status: String?
//        
//        public init(name: String? = nil, g_status: String? = nil, b_status: String? = nil) {
//            self.name = name
//            self.g_status = g_status
//            self.b_status = b_status
//        }
//    }
//}
//
//public struct PrtdObjLib {
//    var icon        : String?
//    var title        : String?
//    var ip            : String?
//    var subtitle    : String?
//    var b_title        : String?
//    var b_subtitle    : String?
//    var b_status    : String?
//    var modal_title    : String?
//    var modal_text    : String?
//    var issues        : [IssuesObjLib]?
//    
//    public init(icon: String? = nil, title: String? = nil, ip: String? = nil, subtitle: String? = nil, b_title: String? = nil, b_subtitle: String? = nil, b_status: String? = nil, modal_title: String? = nil, modal_text: String? = nil, issues: [IssuesObjLib]? = nil) {
//        self.icon = icon
//        self.title = title
//        self.ip = ip
//        self.subtitle = subtitle
//        self.b_title = b_title
//        self.b_subtitle = b_subtitle
//        self.b_status = b_status
//        self.modal_title = modal_title
//        self.modal_text = modal_text
//        self.issues = issues
//    }
//    
//    public struct IssuesObjLib {
//        var icon    : String?
//        var name: String?
//        var status: String?
//        
//        public init(icon: String? = nil, name: String? = nil, status: String? = nil) {
//            self.icon = icon
//            self.name = name
//            self.status = status
//        }
//    }
//}
//
//public struct Gap: Codable {
//    let orderIndex: Int
//    let title: String
//    let titleTwo: String
//    let objecs: [Objec]
//    
//    enum CodingKeys: String, CodingKey {
//        case titleTwo = "title_two"
//        case orderIndex = "order_index"
//        case title, objecs
//    }
//}
//
//// MARK: - Objec
//struct Objec: Codable {
//    let prgrsTitle: String
//    let strigs: [StringVariant]
//    let messIcon, messTlt: String
//    let subMessTlt, subMessTxt: String?
//    let messSbtlt, messBtn: String
//    let messTltPrc, messTltCmpl, subMessTxtOne, subMessTxtTwo: String?
//    let subMessTxtThree, strigsTlt, strigsSubtlt, strigsRes: String?
//    let messTltRed: [String]?
//    
//    enum CodingKeys: String, CodingKey {
//        case prgrsTitle = "prgrs_title"
//        case strigs
//        case messIcon = "mess_icon"
//        case messTlt = "mess_tlt"
//        case subMessTlt = "sub_mess_tlt"
//        case subMessTxt = "sub_mess_txt"
//        case messSbtlt = "mess_sbtlt"
//        case messBtn = "mess_btn"
//        case messTltPrc = "mess_tlt_prc"
//        case messTltCmpl = "mess_tlt_cmpl"
//        case subMessTxtOne = "sub_mess_txt_one"
//        case subMessTxtTwo = "sub_mess_txt_two"
//        case subMessTxtThree = "sub_mess_txt_three"
//        case strigsTlt = "strigs_tlt"
//        case strigsSubtlt = "strigs_subtlt"
//        case strigsRes = "strigs_res"
//        case messTltRed = "mess_tlt_red"
//    }
//}
//
//// MARK: - Strig
//struct Strig: Codable {
//    let name: String
//    let color: String?
//    let icn: String?
//}
//
//public enum StringVariant: Codable, Hashable {
//    case standard(StandardString)
//    case antivirus(AntivirusString)
//    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case color
//        case icn
//        case threatCount
//    }
//    
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        if let name = try? container.decode(String.self, forKey: .name),
//           let color = try? container.decode(String.self, forKey: .color) {
//            self = .standard(StandardString(name: name, color: color))
//        } else if let name = try? container.decode(String.self, forKey: .name),
//                  let icn = try? container.decode(String.self, forKey: .icn) {
//            self = .antivirus(AntivirusString(name: name, icn: icn,
//                                              threatCount: Int.random(in: 1...6)))
//        } else {
//            throw DecodingError.dataCorruptedError(
//                forKey: .name,
//                in: container,
//                debugDescription: "Unable to decode StringVariant"
//            )
//        }
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        switch self {
//        case .standard(let standardString):
//            try container.encode(standardString.name, forKey: .name)
//            try container.encode(standardString.color, forKey: .color)
//        case .antivirus(let antivirusString):
//            try container.encode(antivirusString.name, forKey: .name)
//            try container.encode(antivirusString.icn, forKey: .icn)
//            try container.encode(antivirusString.threatCount, forKey: .threatCount)
//        }
//    }
//}
//
//public struct StandardString: Codable, Hashable {
//    let name: String
//    let color: String
//}
//
//public struct AntivirusString: Codable, Hashable {
//    let name: String
//    let icn: String
//    var threatCount: Int?
//}
//
//public struct GapLib {
//    let orderIndex: Int
//    let title: String
//    let titleTwo: String
//    let objecs: [ObjecLib]?
//    
//    public init(orderIndex: Int, title: String, titleTwo: String, objecs: [ObjecLib]?) {
//        self.orderIndex = orderIndex
//        self.title = title
//        self.titleTwo = titleTwo
//        self.objecs = objecs
//    }
//}
//
//public struct ObjecLib {
//    let prgrsTitle: String
//    let strigs: [StrigLib]
//    let messIcon, messTlt: String
//    let subMessTlt, subMessTxt: String?
//    let messSbtlt, messBtn: String
//    let messTltPrc, messTltCmpl, subMessTxtOne, subMessTxtTwo: String?
//    let subMessTxtThree, strigsTlt, strigsSubtlt, strigsRes: String?
//    let messTltRed: [String]?
//    
//    public init(prgrsTitle: String, strigs: [StrigLib], messIcon: String, messTlt: String, subMessTlt: String?, subMessTxt: String?, messSbtlt: String, messBtn: String, messTltPrc: String?, messTltCmpl: String?, subMessTxtOne: String?, subMessTxtTwo: String?, subMessTxtThree: String?, strigsTlt: String?, strigsSubtlt: String?, strigsRes: String?, messTltRed: [String]?) {
//        self.prgrsTitle = prgrsTitle
//        self.strigs = strigs
//        self.messIcon = messIcon
//        self.messTlt = messTlt
//        self.subMessTlt = subMessTlt
//        self.subMessTxt = subMessTxt
//        self.messSbtlt = messSbtlt
//        self.messBtn = messBtn
//        self.messTltPrc = messTltPrc
//        self.messTltCmpl = messTltCmpl
//        self.subMessTxtOne = subMessTxtOne
//        self.subMessTxtTwo = subMessTxtTwo
//        self.subMessTxtThree = subMessTxtThree
//        self.strigsTlt = strigsTlt
//        self.strigsSubtlt = strigsSubtlt
//        self.strigsRes = strigsRes
//        self.messTltRed = messTltRed
//    }
//}
//
//public struct StrigLib {
//    let name: String
//    let color: String?
//    let icn: String?
//    
//    public init(name: String, color: String?, icn: String?) {
//        self.name = name
//        self.color = color
//        self.icn = icn
//    }
//}
//
//public struct SheetLib {
//    let title_1: String
//    let title_2: String
//    let subtitle: String
//    let status_1: String
//    let status_2: String
//    let status_3: String
//    let status_4: String
//    let btn_1: String
//    let btn_2: String
//    let inf_1: String
//    let inf_2: String
//    let inf_3: String
//    let ic_1: String
//    let ic_2: String
//    let ic_3: String
//    let ic_4: String
//    let ic_5: String
//    
//    public init(title1: String, title2: String, subtitle: String, status1: String, status2: String, status3: String, status4: String, btn1: String, btn2: String, inf1: String, inf2: String, inf3: String, ic1: String, ic2: String, ic3: String, ic4: String, ic5: String) {
//        self.title1 = title1
//        self.title2 = title2
//        self.subtitle = subtitle
//        self.status1 = status1
//        self.status2 = status2
//        self.status3 = status3
//        self.status4 = status4
//        self.btn1 = btn1
//        self.btn2 = btn2
//        self.inf1 = inf1
//        self.inf2 = inf2
//        self.inf3 = inf3
//        self.ic1 = ic1
//        self.ic2 = ic2
//        self.ic3 = ic3
//        self.ic4 = ic4
//        self.ic5 = ic5
//    }
//}

public struct EnterModel: Codable {
    public var token: String
    public var screen: Int?
    public var offer: AuthorizationOfferObject?
    
    enum CodingKeys: String, CodingKey {
        case token
        case screen
        case offer = "specialize"
    }
}

public struct AuthorizationOfferObject: Codable {
    public var isActive: Bool
    public var data: AuthorizationOfferModel?
    
    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case data
    }
}

public struct AuthorizationOfferModel: Codable {
    var imageUrl: String
    var title: String
    var subtitle: String
    var benefitTitle: String
    var benefitDescriptions: [String]
    var btnTitle: String
    public var stTitle: String
    public var stSubtitle: String
    var poText: String
    var bzz: Bool?
    var settings: [String]?
    var settingsIcon: String?
    var settingsAnimation: String?
    var settingsTitle: String?
    var settingsBtnTitle: String?
    var modalTitle: String?
    var modalText: String?
    var modalIcon: String?
    var modalBtn: String?
    var pushIcon: String?
    var pushTitle: String?
    var pushText: String?
    var homeTitle: String?
    var homeSub: String?
    var homeIcon: String?
    var scn: ScnModel?
    var prtd: PrtdModel?
    var objectTwo: ObjectTwo?
    var gap: Gap?
    var sheet: SheetObject?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case title
        case subtitle
        case benefitTitle = "benefit_title"
        case benefitDescriptions = "benefit_descriptions"
        case btnTitle = "btn_title"
        case stTitle = "st_title1"
        case stSubtitle  = "st_title2"
        case poText = "po_text"
        case bzz
        case settingsAnimation = "settings_anime"
        case settings
        case settingsTitle = "settings_title"
        case settingsBtnTitle = "settings_btn"
        case settingsIcon = "settings_icon"
        case modalTitle = "modal_title"
        case modalText = "modal_text"
        case modalIcon = "modal_icon"
        case modalBtn = "modal_btn"
        case pushIcon = "push_icon"
        case pushTitle = "push_title"
        case pushText = "push_text"
        case homeTitle = "home_title"
        case homeSub = "home_sub"
        case homeIcon = "home_icon"
        case scn, prtd, gap, sheet
        case objectTwo = "object_2"
    }
}

struct ScnModel: Codable {
    var title_proc            : String?
    var subtitle_proc        : String?
    var title_anim_proc        : String?
    var subtitle_anim_proc    : String?
    var title_compl            : String?
    var subtitle_compl        : String?
    var title_anim_compl    : String?
    var subtitle_anim_compl    : String?
    var title_unp            : String?
    var subtitle_unp        : String?
    var title_anim_unp        : String?
    var subtitle_anim_unp    : String?
    var banner_title        : String?
    var banner_subtitle        : String?
    var banner_icon            : String?
    var banner_icon_unp        : String?
    var btn                    : String?
    var anim_scn            : String?
    var anim_done            : String?
    var anim_scn_unp        : String?
    var anim_done_unp        : String?
    var rr_title            : String?
    var rr_subtitle            : String?
    
    var features            : [Features]?
    
    struct Features: Codable {
        var name    : String?
        var g_status: String?
        var b_status: String?
    }
}

struct ObjectTwo: Codable {
    let center: Center
    let dark_blue: DarkBlue
    let description: Description
    
    struct Center: Codable {
        var title    : String?
        var subtitle: String?
        var footer_text: String?
        var res_color: String?
        var items: [Items]
        
        struct Items: Codable {
            let name: String?
            let res: String?
        }
    }
    
    struct DarkBlue: Codable {
        var subtitle: String?
        var small_img: String?
        var title: String?
        var al_title: String?
        var al_subtitle: String?
        var al_subtitle_no_bio: String?
        var main_img: String?
        var btn_title: String?
        var footer_text: String?
    }
    
    struct Description: Codable {
        var btn_subtitle_color: String?
        var subtitle: String?
        var items_title: String?
        var title: String?
        var btn_subtitle: String?
        var main_img: String?
        var btn_title: String?
        var items: [String]?
    }
}

struct PrtdModel: Codable{
    var icon        : String?
    var title        : String?
    var ip            : String?
    var subtitle    : String?
    var b_title        : String?
    var b_subtitle    : String?
    var b_status    : String?
    var modal_title    : String?
    var modal_text    : String?
    var issues        : [IssuesObj]?
    
    struct IssuesObj: Codable {
        var icon    : String?
        var name: String?
        var status: String?
    }
}

struct Gap: Codable {
    let orderIndex: Int
    let title: String
    let titleTwo: String
    let objecs: [Objec]

    enum CodingKeys: String, CodingKey {
        case titleTwo = "title_two"
        case orderIndex = "order_index"
        case title, objecs
    }
}

struct Objec: Codable {
    let prgrsTitle: String
    let strigs: [Strig]
    let messIcon, messTlt: String
    let subMessTlt, subMessTxt: String?
    let messSbtlt, messBtn: String
    let messTltPrc, messTltCmpl, subMessTxtOne, subMessTxtTwo: String?
    let subMessTxtThree, strigsTlt, strigsSubtlt, strigsRes: String?
    let messTltRed: [String]?

    enum CodingKeys: String, CodingKey {
        case prgrsTitle = "prgrs_title"
        case strigs
        case messIcon = "mess_icon"
        case messTlt = "mess_tlt"
        case subMessTlt = "sub_mess_tlt"
        case subMessTxt = "sub_mess_txt"
        case messSbtlt = "mess_sbtlt"
        case messBtn = "mess_btn"
        case messTltPrc = "mess_tlt_prc"
        case messTltCmpl = "mess_tlt_cmpl"
        case subMessTxtOne = "sub_mess_txt_one"
        case subMessTxtTwo = "sub_mess_txt_two"
        case subMessTxtThree = "sub_mess_txt_three"
        case strigsTlt = "strigs_tlt"
        case strigsSubtlt = "strigs_subtlt"
        case strigsRes = "strigs_res"
        case messTltRed = "mess_tlt_red"
    }
}

struct Strig: Codable {
    let name: String
    let color: String?
    let icn: String?
}

struct SheetObject: Codable {
    let title_1:String
    let title_2:String
    let subtitle:String
    let status_1:String
    let status_2:String
    let status_3:String
    let status_4:String
    let btn_1:String
    let btn_2:String
    let inf_1:String
    let inf_2:String
    let inf_3:String
    let ic_1:String
    let ic_2:String
    let ic_3:String
    let ic_4:String
    let ic_5:String
}
