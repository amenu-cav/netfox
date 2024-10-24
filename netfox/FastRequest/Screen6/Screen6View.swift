import Foundation
import SwiftUI

public struct Screen6View: View {
    let data = [
        ("89 viruses", "Danger!"),
        ("45 vulnerabilities", "Critical!"),
        ("8 threats", "Danger!"),
        ("Battery condition", "Unsatisfactory!")
    ]
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Protection Center")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .foregroundColor(.black)
                
                List {
                    Section {
                        ForEach(data, id: \.0) {item in
                            HStack {
                                Text(item.0)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                Text(item.1)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.red)
                            }
                            .listRowBackground(Color.white)
                        }
                    } header: {
                        Text("Found on your phone")
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .scrollIndicators(.hidden)
                .frame(height: 220)
                .background(Color(UIColor(red: 243/255, green: 243/255, blue: 247/255, alpha: 1)))
                .scrollContentBackground(.hidden)
                
                BottomCustomView {
                    print("test Screen 2")
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
            }
            Text("If you ignore the vulnerabilities found on your phone, Apple will not be held responsible.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 21)
                .padding(.bottom, 15)
        }
        .background(Color(UIColor(red: 243/255, green: 243/255, blue: 247/255, alpha: 1)))
        .navigationBarHidden(true)
    }
}

struct BottomCustomView: View {
    var buttonTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                Image("Screen6Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your phone system is in danger!")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Alert from the Defense Center!")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color(UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)))
                }
            }
            
            HStack {
                Text("""
                If you don’t remove viruses:
                1. Your battery will overheat
                2. Your contacts may be lost
                3. Your photos will be lost
                4. Your SIM-card may be damaged
                """)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            Divider()
            
            Button(action: buttonTapped) {
                Text("Protect now")
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .frame(height: 38)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(19)
            }
            
            Text("You need to remove any vulnerabilities you find!")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)), lineWidth: 0.5)
        )
    }
}
