
import SwiftUI

enum Screen1State {
    case green
    case red
}

struct MockInfoItem: Hashable {
    let title: String
    let imageName: String
}

public struct Screen1View: View {
    @Environment(\.dismiss) var dismiss
    
    let state: Screen1State
    
    private let greenMockArray: [MockInfoItem] = [
        .init(title: "Keep your internet fast with unlimited speed tests.", imageName: "Screen1Icon"),
        .init(title: "Clean up your device with unlimited removal capabilities.", imageName: "Screen1Icon2"),
        .init(title: "Easily organize and manage all your contacts in one place.", imageName: "Screen1Icon3"),
    ]
    
    private let redMockArray: [MockInfoItem] = [
        .init(title: "Your internet connection will become unstable", imageName: "Screen1Icon"),
        .init(title: "Your media files are in danger and can be lost forever", imageName: "Screen1Icon2"),
        .init(title: "You contact list can be leaked into the Web.", imageName: "Screen1Icon3"),
    ]
    
    public var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                Image(state == .green
                      ? "Screen1IMG"
                      : "Screen1IMG2")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: Constants.smallScreen ? .fill : .fit)
                .ignoresSafeArea(.all)
                
                VStack {
                    Text(state == .green
                         ? "Unlock Premium Features"
                         : "42 Malware files detected")
                    .font(.system(size: Constants.smallScreen ? 24 : 30, weight: .bold, design: .default))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    
                    Text(state == .green
                         ? "Unlock full power of Organizer and keep your device safe!"
                         : "Keep your device safe! Remove suspicious files")
                    .font(.system(size: Constants.smallScreen ? 16 : 18, weight: .medium, design: .default))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    
                    Text(state == .green
                         ? "Premium plan includes:"
                         : "Or else...")
                    .textCase(.uppercase)
                    .font(.system(size: Constants.smallScreen ? 14 : 16, weight: .semibold, design: .default))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    
                    ScrollView {
                        ForEach(state == .green
                                ? greenMockArray
                                : redMockArray,
                                id: \.title) { item in
                            InfoCellView(title: item.title, iconName: item.imageName)
                                .padding(.horizontal, 1)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .frame(minHeight: 50)
                    
                    Button(action: {
                        
                    }) {
                        HStack() {
                            Spacer()
                            Text(state == .green
                                 ? "Grab the deal"
                                 : "Remove files")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding()
                            
                            
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        
                    }
                    
                    if state == .green {
                        Text("$49.99 per year. Cancel anytime")
                            .font(.system(size: 13, weight: .medium, design: .default))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.top, 0)
                .padding(.bottom)
                
            }
            .background(Color.white)
            .ignoresSafeArea(.all)
            .navigationBarHidden(true)
            
            VStack {
                HStack {
                    Button(action: {
                        closeVC()
                    }, label: {
                        Image("close")
                    })
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
    
    private func closeVC() {
        dismiss()
    }
}

#Preview {
    Screen1View(state: .green)
}
