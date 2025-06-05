import Foundation
import SwiftUI
import Kingfisher

struct FastRequestResultBoxStatsView: View {
    let title: String
    let subttitle: String
    let imageUrl: String
    let backColor: Color
        
    var body: some View {
        
        HStack {
            KFImage(URL(string: imageUrl))
                .setProcessor(SVGImgProcessor())
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.black)
//                    .minimumScaleFactor(0.2)
//                    .lineLimit(1)
                
                Text(subttitle)
                    .font(.system(size: 10, weight: .medium, design: .default))
                    .foregroundColor(Color(red: 103/255, green: 103/255, blue: 103/255))
            }
            
            Spacer()
            
//            Image(systemName: "chevron.right")
//                .scaledToFit()
//                .frame(width: 4, height: 8)
//                .tint(Color(red: 156/255, green: 156/255, blue: 156/255))
            Image(systemName: "chevron.right")
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 4, height: 8)
                .foregroundColor(Color(red: 156/255, green: 156/255, blue: 156/255)) 
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(backColor)
        .cornerRadius(15)
    }
}
