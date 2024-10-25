
import Foundation
import SwiftUI
import Kingfisher

struct CustomTopNotificationView: View {
    let model: DataOfferObjectLib?
    @Binding var show: Bool

    var body: some View {
        HStack {
            KFImage(URL(string: model?.pushIcon ?? ""))
                .setProcessor(SVGImgProcessor())
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(model?.pushTitle ?? "")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text("now")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color(red: 61/255, green: 61/255, blue: 62/255))
                        .multilineTextAlignment(.trailing)
                }
                
                Text(model?.pushText ?? "")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(red: 207/255, green: 207/255, blue: 207/255, opacity: 0.95))
        .cornerRadius(24)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.top, 50)
        .onTapGesture {
            withAnimation {
                show = false
            }
        }
    }
}
