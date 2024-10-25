

import Foundation
import SwiftUI

struct CustomCenterAlertView: View {
    @Binding var showAlert: Bool

    var body: some View {
        VStack(spacing: 0) {
            Text("YOUR PHONE HAS BEEN COMPROMISED")
                .font(.system(size: 17, weight: .semibold, design: .default))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)

            Text("Immediate Action is Required!")
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 3)


            Image("Screen3Icon1")
                .padding(.vertical)
            
            Divider()
            
            Button(action: {
                withAnimation {
                    showAlert = false
                }
            }) {
                Text("PROTECT YOURSELF")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 0)
            }
            .padding(.top, 11)
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
