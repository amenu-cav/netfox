import Foundation
import SwiftUI

struct TestScreen7ToggleView: View {
    let title: String
    let activeTitle: String
    let disactiveTitle: String
    let backColor: Color
    
    @Binding var isToggleActive: Bool
    
    var body: some View {
        Toggle(isOn: $isToggleActive) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: Constants.smallScreen ? 9 : 10, weight: .medium, design: .default))
                        .foregroundColor(Color(red: 103/255, green: 103/255, blue: 103/255))
                    
                    HStack(spacing: 5) {
                        Image(isToggleActive ? "Screen7GreenMark" : "Screen7RedMark")
                            .frame(width: 12, height: 12)
                        
                        Text(isToggleActive ? activeTitle : disactiveTitle)
                            .font(.system(size: Constants.smallScreen ? 12 : 14, weight: .semibold, design: .default))
                            .foregroundColor(isToggleActive ? .green : .red)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .background(backColor)
        .cornerRadius(10)
    }
}
