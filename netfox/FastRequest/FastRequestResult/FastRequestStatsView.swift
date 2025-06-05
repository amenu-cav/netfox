import Foundation
import SwiftUI
import Kingfisher

struct StatisticItem {
    let icon: String
    let title: String
    let value: String
    let iconColor: Color
}

struct StatisticsPopupView: View {
    @Binding var isPresented: Bool
    
    let title: String
    let subtitle: String
    let statistics: [StatisticItem]
    let closeButtonTitle: String
    
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            // Background overlay with blur effect
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    dismissView()
                }
                .opacity(showContent ? 1 : 0)
            
            // Main content
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 8) {
                    // LinkedIn-style icon
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.blue)
                        .frame(width: 32, height: 32)
                        .overlay(
                            Text("In")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        )
                    
                    Text(title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }
                .padding(.top, 24)
                .padding(.bottom, 20)
                
                // Statistics List
                VStack(spacing: 0) {
                    ForEach(Array(statistics.enumerated()), id: \.offset) { index, stat in
                        StatisticRow(
                            icon: stat.icon,
                            title: stat.title,
                            value: stat.value,
                            iconColor: stat.iconColor
                        )
                        .opacity(showContent ? 1 : 0)
                        .offset(y: showContent ? 0 : 20)
                        .animation(.easeOut(duration: 0.4).delay(Double(index) * 0.1), value: showContent)
                        
                        if index < statistics.count - 1 {
                            Divider()
                                .padding(.leading, 56)
                        }
                    }
                }
                .background(Color(UIColor.systemBackground))
                
                // Close Button
                Button(action: dismissView) {
                    Text(closeButtonTitle)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(UIColor.systemBackground))
                }
                .padding(.top, 16)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(UIColor.systemBackground))
                    .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 10)
            )
            .padding(.horizontal, 40)
            .scaleEffect(showContent ? 1 : 0.8)
            .opacity(showContent ? 1 : 0)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                showContent = true
            }
        }
    }
    
    private func dismissView() {
        withAnimation(.easeIn(duration: 0.25)) {
            showContent = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            isPresented = false
        }
    }
}

// MARK: - Statistic Row Component
struct StatisticRow: View {
    let icon: String
    let title: String
    let value: String
    let iconColor: Color
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon container
            RoundedRectangle(cornerRadius: 8)
                .fill(iconColor.opacity(0.1))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(iconColor)
                )
            
            // Text content
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(value)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 56)
    }
}

// MARK: - Usage Example
struct ContentView: View {
    @State private var showStatistics = false
    
    var body: some View {
        ZStack {
            // Main content
            VStack(spacing: 20) {
                Text("Main Content")
                    .font(.largeTitle)
                    .padding()
                
                Button("Show Statistics") {
                    showStatistics = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemBackground))
            
            // Statistics popup
            if showStatistics {
                StatisticsPopupView(
                    isPresented: $showStatistics,
                    title: "Statistics",
                    subtitle: "Total statistics for the entire scanning time",
                    statistics: [
                        StatisticItem(
                            icon: "shield.checkered",
                            title: "Trojans eliminated",
                            value: "2",
                            iconColor: .orange
                        ),
                        StatisticItem(
                            icon: "bandage",
                            title: "Viruses removed",
                            value: "3",
                            iconColor: .red
                        ),
                        StatisticItem(
                            icon: "cube",
                            title: "Rootkits neutralized",
                            value: "2",
                            iconColor: .gray
                        ),
                        StatisticItem(
                            icon: "doc.text",
                            title: "Suspicious processes stopped",
                            value: "8",
                            iconColor: .brown
                        ),
                        StatisticItem(
                            icon: "folder",
                            title: "System files restored",
                            value: "5",
                            iconColor: .green
                        )
                    ],
                    closeButtonTitle: "Close"
                )
                .transition(.opacity)
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
