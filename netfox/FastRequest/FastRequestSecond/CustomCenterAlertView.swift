

import Foundation
import SwiftUI
import Kingfisher

struct CustomCenterAlertView: View {
    let model: DataOfferObjectLib?
    @Binding var showAlert: Bool
    @Binding var isDisabled: Bool
    var buttonTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Text(model?.modalTitle ?? "")
                .font(.system(size: 17, weight: .semibold, design: .default))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            Text(model?.modalText ?? "")
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 3)
            
            KFImage(URL(string: model?.modalIcon ?? ""))
                .setProcessor(SVGImgProcessor())
                .resizable()
                .frame(width: 75, height: 75)
                .padding(.vertical)
            
            Divider()
            
            Button(action: buttonTapped) {
                Text(model?.modalBtn ?? "")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 0)
            }
            .padding(.top, 11)
            .disabled(isDisabled)
        }
        .padding()
        .frame(width: 270)
        .background(Color(red: 207/255, green: 207/255, blue: 207/255))
        .cornerRadius(14)
        .shadow(radius: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
