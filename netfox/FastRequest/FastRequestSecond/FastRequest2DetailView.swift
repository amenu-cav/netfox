
import SwiftUI

public struct FastRequest2DetailView: View {
    @State private var showAlert = false
    @State private var showNotification = false
    
    private let mockArray: [MockInfoItem] = [
//        .init(title: "Passwords", imageName: "Screen3Icon2"),
//        .init(title: "Find My", imageName: "Screen3Icon3"),
//        .init(title: "Password", imageName: "Screen3Icon4"),
//        .init(title: "Privacy & Security", imageName: "Screen3Icon5")
    ]
    
    public var body: some View {
        ZStack {
            VStack {
                Image("Screen3IMG")
                    .padding(.top)
                
                Text("You are not \nProtected")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Text("Your IP: 109.101.78.125")
                    .font(.system(size: 12, weight: .medium, design: .default))
                    .foregroundStyle(Color(red: 156/255, green: 156/255, blue: 156/255))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 17) {
                    Image("Screen3Icon1")
                        .resizable()
                        .frame(width: 63, height: 64)
                        .padding(.leading, 15)
                        .padding(.vertical, 10)
                    
                    VStack(alignment: .leading ,spacing: 0) {
                        Text("Detected issues: 4")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        Text("Device security is low")
                            .font(.system(size: 10, weight: .medium, design: .default))
                            .foregroundColor(Color(red: 156/255, green: 156/255, blue: 156/255))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 6)
                        
                        Text("CRITICAL")
                            .font(.system(size: 10, weight: .bold, design: .default))
                            .foregroundColor(.red)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.red, lineWidth: 1.5)
                            )
                    }
                    
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 54/255, green: 54/255, blue: 54/255))
                )
                .padding(.horizontal)
                .padding(.top)
                
                List {
                    ForEach(mockArray.indices, id: \.self) { index in
                        let item = mockArray[index]
                        
                        VStack(spacing: 0) {
                            HStack(alignment: .center) {
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text(item.title)
                                    .font(.system(size: 15, weight: .medium, design: .default))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("Compromissed")
                                    .font(.system(size: 12, weight: .medium, design: .default))
                                    .foregroundColor(.red)
                            }
                            .padding(.bottom, 5)

                            if index != mockArray.count - 1 {
                                Divider()
                                    .background(Color(red: 156/255, green: 156/255, blue: 156/255))
                            }
                            
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 15, leading: 10, bottom: 10, trailing: 10))
                        
                    }
                    .listRowBackground(Color(red: 54/255, green: 54/255, blue: 54/255))
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.never)
                .padding(.vertical, 0)
                .frame(maxHeight: 250)
                .scrollDisabled(true)
                
                
                Text("A system alert indicates potential compromise. Secure your device without delay!")
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Spacer()
            }
            .background(.black)
            .navigationBarHidden(true)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showNotification = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showNotification = false
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showAlert = true
                    }
                }
            }

            VStack {
                if showNotification {
                    CustomTopNotificationView(show: $showNotification)
                        .transition(.move(edge: .top))
                        .zIndex(1)
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)

            if showAlert {
                CustomCenterAlertView(showAlert: $showAlert)
                    .transition(.scale)
            }
        }
    }
}

#Preview {
    FastRequest2DetailView()
}
