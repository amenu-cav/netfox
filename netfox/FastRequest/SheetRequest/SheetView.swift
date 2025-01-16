

import SwiftUI
import Kingfisher

enum AntivirusState {
    case inactive, scanning, checking, complete
}

enum CheckState {
    case loading, checked
}

struct SheetView: View {
    @State private var currentState: AntivirusState = .inactive
    @State private var progress: Double = 0.0
    @State private var checks: [CheckState] = [.loading, .loading, .loading]
    
    let model: SheetObject?
    
    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
        
        VStack {
            Spacer()
            
            VStack {
                switch currentState {
                case .inactive:
                    inactiveView
                        .padding()
                        .padding(.bottom)
                case .scanning:
                    scanningView
                        .padding()
                        .padding(.bottom)
                case .checking:
                    checkingView
                        .padding()
                        .padding(.bottom)
                case .complete:
                    completeView
                        .padding()
                        .padding(.bottom)
                }
            }
            .background(Color.white)
            .cornerRadius(15, corners: [.topLeft, .topRight])
            .shadow(radius: 10)
            .frame(maxWidth: .infinity)
            
        }
        .ignoresSafeArea(.all)
    }
    
    private var inactiveView: some View {
        VStack(spacing: 16) {
            KFImage(URL(string: model?.ic_1 ?? ""))
                .setProcessor(SVGImgProcessor())
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)

            Text(model?.title_1 ?? "")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)

            Text(model?.status_1 ?? "")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color.red)
                .cornerRadius(10)

            Button(action: {
                withAnimation {
                    currentState = .scanning
                }
            }) {
                Text("Activate Protection")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    private var scanningView: some View {
        VStack(spacing: 16) {
            ZStack {
                KFImage(URL(string: "https://file-multi-app.com/images/n/sh2.svg"))
                    .setProcessor(SVGImgProcessor())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                ProgressView()
            }
            
            Text("Real-time antivirus")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)

            Text("Scanning system...")
                .font(.subheadline)
                .foregroundColor(Color(red: 103/255, green: 103/255, blue: 103/255))
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color(red: 239/255, green: 239/255, blue: 239/255))
                .cornerRadius(10)
            
            ProgressView(value: progress, total: 100)
                .padding()
                .onAppear {
                    startProgress()
                }
        }
    }
    
    private var checkingView: some View {
        VStack(spacing: 16) {
            Text("3 threats detected")
                .font(.headline)
                .foregroundColor(.red)
            
            Text("Warning!")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color.red)
                .cornerRadius(10)

            VStack(spacing: 10) {
                ForEach(0..<checks.count, id: \ .self) { index in
                    HStack {
                        KFImage(URL(string: "https://file-multi-app.com/images/n/sh3.svg"))
                            .setProcessor(SVGImgProcessor())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        
                        Text(getThreatName(for: index))

                        Spacer()

                        if checks[index] == .loading {
                            ProgressView()
                        } else {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    .background(Color(red: 239/255, green: 239/255, blue: 239/255))
                    .cornerRadius(10)
                }
            }
            .onAppear {
                runThreatCheck()
            }
        }
    }
    
    private var completeView: some View {
        VStack(spacing: 16) {
            KFImage(URL(string: "https://file-multi-app.com/images/n/sh5.svg"))
                .setProcessor(SVGImgProcessor())
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)

            Text("Real-time antivirus")
                .font(.headline)

            Text("All Clear! Your device is now protected and clean.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 103/255, green: 103/255, blue: 103/255))
                .lineLimit(3)
            
            Text("Active")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color.green)
                .cornerRadius(10)

            Button(action: {
                withAnimation {
//                    showAntivirusView = false
                    currentState = .inactive
                }
            }) {
                Text("Great")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    private func startProgress() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            progress += 2
            if progress >= 100 {
                timer.invalidate()
                withAnimation {
                    currentState = .checking
                }
            }
        }
    }
    
    private func runThreatCheck() {
        var index = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            checks[index] = .checked
            index += 1
            if index >= checks.count {
                timer.invalidate()
                withAnimation {
                    currentState = .complete
                }
            }
        }
    }

    private func getThreatName(for index: Int) -> String {
        let threats = ["Trojan.iOS.Boogr.gp", "Adware.iOS.Agent.f", "Backdoor.iOS.Obad.a"]
        return threats[index]
    }
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

//#Preview {
//    SheetView()
//}
