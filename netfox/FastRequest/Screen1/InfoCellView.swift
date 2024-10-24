

import Foundation
import SwiftUI

struct InfoCellView: View {
    let title: String
    let iconName: String
    
    var body: some View {
            HStack(spacing: 12) {
                Image(iconName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 10)
                    .padding(.vertical, 10)
                
                Text(title)
                    .font(.system(size: 14, weight: .none, design: .default))
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
