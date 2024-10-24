import Foundation
import SwiftUI

enum ActiveAlert {
    case first, second
}

struct Screen5View: View {
    @State private var showAlert = true
    @State private var activeAlert: ActiveAlert = .first

    var body: some View {
        VStack {
            Image("Screen5AtIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 109, height: 97)
                .padding(.top, 20)

            Text("Malware Detected")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 15)

            Text("39 viruses were found.")
                .font(.system(size: 22, weight: .regular))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
            
            Spacer()

            Text("""
            If you don’t remove viruses:
            1. Your battery will overheat
            2. Your contacts may be lost
            3. Your photos will be lost
            4. Your SIM-card may be damaged
            """)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 15)
            
            Spacer()

            HStack(spacing: 10) {
                Image("Screen5Atte")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)

                Text("You need to remove 39 viruses")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.top, 15)

            Button(action: {
                activeAlert = .second
                showAlert = true
            }) {
                Text("REMOVE VIRUSES")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 115/255, green: 199/255, blue: 0/255))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 37)
            .padding(.bottom, 30)
        }
        .background(Color(red: 29/255, green: 34/255, blue: 57/255))
        .navigationBarHidden(true)
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .first:
                return Alert(
                    title: Text("Malware detected"),
                    message: Text("39 viruses were found."),
                    dismissButton: .default(Text("OK"), action: {
                        showAlert = false
                    })
                )
            case .second:
                return Alert(
                    title: Text("Confirm removal"),
                    message: Text("You will need to enter your password or use Touch-ID"),
                    primaryButton: .cancel(Text("Cancel")),
                    secondaryButton: .default(Text("OK"), action: {
                        print("action")
                    })
                )
            }
        }
    }
}

struct Screen5View_Previews: PreviewProvider {
    static var previews: some View {
        Screen5View()
    }
}

