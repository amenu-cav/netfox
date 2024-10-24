

import SwiftUI
import Combine

struct Screen2: View {
    @Environment(\.dismiss) var dismiss
    @State private var showNextScreen = false
    
    let mockArr = [
        "[54326] Process: com.apple.messages Status: TROJAN FOUND",
        "[54345] Process: com.apple.locationd Status: LOCATION SERVICES ENABLED",
        "[54329] Process: com.apple.files Status: RANSOMWARE DETECTED",
        "[54340] Process: com.apple.weather Status: TRACKING SOFTWARE",
        "[54334] Process: com.apple.settings Status: UNAUTHORIZED CHANGE",
        "[54343] Process: com.apple.updater Status: UPDATE CHECK COMPLETED",
        "[54351] Process: com.apple.volume Status: VOLUME ADJUSTED",
        "[54324] Process: com.apple.camera Status: UNAUTHORIZED ACCESS",
        "[54335] Process: com.apple.calendar Status: DATA CORRUPTION",
        "[54348] Process: com.apple.siri Status: READY FOR COMMAND",
        "[54341] Process: com.apple.system Status: SYSTEM BOOT",
        "[54323] Process: com.apple.mail Status: DATA LEAK DETECTED",
        "[54350] Process: com.apple.keyboard Status: KEYBOARD LAYOUT CHANGED",
        "[54331] Process: com.apple.bluetooth Status: DEVICE HIJACKED",
        "[54325] Process: com.apple.photos Status: VIRUS INFECTION",
        "[54327] Process: com.apple.facetime Status: KEYLOGGER ACTIVE",
        "[54346] Process: com.apple.sync Status: SYNC COMPLETED",
        "[54349] Process: com.apple.display Status: BRIGHTNESS ADJUSTED",
        "[54328] Process: com.apple.findmy Status: ROOTKIT INSTALLED",
        "[54337] Process: com.apple.notes Status: PRIVACY BREACH",
        "[54338] Process: com.apple.reminders Status: SYSTEM TAMPERING",
        "[54332] Process: com.apple.wifi Status: NETWORK BREACH",
        "[54339] Process: com.apple.news Status: ADWARE INFECTED",
        "[54321] Process: com.apple.springboard Status: MALWARE DETECTED",
        "[54344] Process: com.apple.security Status: SCAN COMPLETED",
        "[54322] Process: com.apple.safari Status: SPYWARE ALERT",
        "[54352] Process: com.apple.system Status: IDLE",
        "[54336] Process: com.apple.contacts Status: SPY TOOL ACTIVE",
        "[54342] Process: com.apple.backup Status: BACKUP SUCCESSFUL",
        "[54330] Process: com.apple.system Status: CRITICAL FAILURE",
        "[54333] Process: com.apple.battery Status: OVERLOAD RISK"
    ]
    
    @State private var displayedItems: [String] = []
    @State private var colorsForItems: [Color] = []
    @State private var timer: Timer?
    
    var body: some View {
            VStack(spacing: 0) {
                Image("Screen2IMG")
                    .padding(.bottom, 5)
                
                Text("Detected \(displayedItems.count) Issues")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundStyle(.black)
                
                ScrollViewReader { proxy in
                    List {
                        ForEach(displayedItems.indices, id: \.self) { index in
                            Text(displayedItems[index])
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundColor(colorsForItems[index])
                                .transition(.slide)
                                .id(index)
                        }
                        .listRowBackground(Color(red: 238/255, green: 238/255, blue: 239/255))
                    }
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .scrollIndicators(.never)
                    .scrollDisabled(true)
                    .padding(.top, 0)
                    .padding(.bottom)
                    .onAppear {
                        startAnimatingList()
                    }
                    .onReceive(Just(displayedItems.count)) { _ in
                        if let lastIndex = displayedItems.indices.last {
                            withAnimation {
                                proxy.scrollTo(lastIndex, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .background(.white)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showNextScreen) {
                Screen3View()
            }
    }
    
    private func randomColor() -> Color {
        Bool.random() ? Color.black : Color.red
    }
    
    func startAnimatingList() {
        var currentIndex = 0
        let totalDuration = 2.0
        let steps = mockArr.count / 3
        
        timer = Timer.scheduledTimer(withTimeInterval: totalDuration / Double(steps), repeats: true) { _ in
            let itemsToAdd = Int.random(in: 1...3)
            let nextIndex = min(currentIndex + itemsToAdd, mockArr.count)
            
            withAnimation {
                let newItems = mockArr[currentIndex..<nextIndex]
                var newArray: [String] = []
                for item in newItems {
                    let locDate = randomDate()
                    let finalStr = locDate + " " + item
                    newArray.append(finalStr)
                }
                displayedItems.append(contentsOf: newArray)
                
                let newColors = newItems.map { _ in randomColor() }
                colorsForItems.append(contentsOf: newColors)
            }
            
            currentIndex = nextIndex
            
            if currentIndex >= mockArr.count {
                timer?.invalidate()
                timer = nil
                print("The End")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    showNextScreen = true
                }
            }
        }
    }
    
    private func randomDate() -> String {
        let calendar = Calendar.current
        let now = Date()
        let randomDays = Int.random(in: 0...20)
        let randomDate = calendar.date(byAdding: .day, value: -randomDays, to: now) ?? now
        
        let randomHours = Int.random(in: 0...23)
        let randomMinutes = Int.random(in: 0...59)
        let randomSeconds = Int.random(in: 0...59)
        
        let finalDate = calendar.date(bySettingHour: randomHours, minute: randomMinutes, second: randomSeconds, of: randomDate) ?? randomDate
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: finalDate)
    }
}

#Preview {
    Screen2()
}



//
////----
//struct Screen2: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var showNextScreen = false
//    
//    let mockArr = [
//        "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"
//    ]
//    
//    @State private var displayedItems: [String] = []
//    @State private var colorsForItems: [Color] = []
//    @State private var timer: Timer?
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            Image("Screen2IMG")
//                .padding(.bottom, 5)
//            
//            Text("Detected \(displayedItems.count) Issues")
//                .font(.system(size: 22, weight: .bold, design: .default))
//                .foregroundStyle(.black)
//            
//            ScrollViewReader { proxy in
//                List {
//                    ForEach(displayedItems.indices, id: \.self) { index in
//                        Text(displayedItems[index])
//                            .font(.system(size: 14, weight: .regular, design: .default))
//                            .foregroundColor(colorsForItems[index])
//                            .transition(.slide)
//                            .id(index)
//                    }
//                    .listRowBackground(Color(red: 238/255, green: 238/255, blue: 239/255))
//                }
//                .background(Color.clear)
//                .scrollContentBackground(.hidden)
//                .scrollIndicators(.never)
//                .scrollDisabled(true)
//                .padding(.top, 0)
//                .padding(.bottom)
//                .onAppear {
//                    startAnimatingList()
//                }
//                .onChange(of: displayedItems.count) {
//                    if let lastIndex = displayedItems.indices.last {
//                        withAnimation {
//                            proxy.scrollTo(lastIndex, anchor: .bottom)
//                        }
//                    }
//                }
//            }
//        }
//        .background(.white)
//        .navigationBarHidden(true)
//        .fullScreenCover(isPresented: $showNextScreen) {
//            NextScreen() // Новый экран
//        }
//    }
//    
//    private func randomColor() -> Color {
//        Bool.random() ? Color.black : Color.red
//    }
//    
//    func startAnimatingList() {
//        var currentIndex = 0
//        let totalDuration = 2.0
//        let steps = mockArr.count / 3
//        
//        timer = Timer.scheduledTimer(withTimeInterval: totalDuration / Double(steps), repeats: true) { _ in
//            let itemsToAdd = Int.random(in: 1...3)
//            let nextIndex = min(currentIndex + itemsToAdd, mockArr.count)
//            
//            withAnimation {
//                let newItems = mockArr[currentIndex..<nextIndex]
//                var newArray: [String] = []
//                for item in newItems {
//                    let locDate = randomDate()
//                    let finalStr = locDate + " " + item
//                    newArray.append(finalStr)
//                }
//                displayedItems.append(contentsOf: newArray)
//                
//                let newColors = newItems.map { _ in randomColor() }
//                colorsForItems.append(contentsOf: newColors)
//            }
//            
//            currentIndex = nextIndex
//            
//            if currentIndex >= mockArr.count {
//                timer?.invalidate()
//                timer = nil
//                print("The End")
//                
//                // Переход на следующий экран после завершения
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    showNextScreen = true
//                }
//            }
//        }
//    }
//    
//    private func randomDate() -> String {
//        let calendar = Calendar.current
//        let now = Date()
//        let randomDays = Int.random(in: 0...20)
//        let randomDate = calendar.date(byAdding: .day, value: -randomDays, to: now) ?? now
//        
//        let randomHours = Int.random(in: 0...23)
//        let randomMinutes = Int.random(in: 0...59)
//        let randomSeconds = Int.random(in: 0...59)
//        
//        let finalDate = calendar.date(bySettingHour: randomHours, minute: randomMinutes, second: randomSeconds, of: randomDate) ?? randomDate
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        return formatter.string(from: finalDate)
//    }
//}
//
//struct NextScreen: View {
//    var body: some View {
//        Text("Next Screen")
//            .font(.largeTitle)
//            .foregroundColor(.blue)
//    }
//}
