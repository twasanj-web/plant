

import SwiftUI

struct PlantListView: View {
    
    @ObservedObject var viewModel: PlantListViewModel
    @State private var showSetReminder = false

    private var wateredCount: Int {
        viewModel.plants.filter { $0.isSelected }.count
    }
    
    private var progress: Double {
        guard !viewModel.plants.isEmpty else { return 0 }
        return Double(wateredCount) / Double(viewModel.plants.count)
    }

    // --- رسالة ديناميكية جديدة ---
    private var progressMessage: String {
        if wateredCount == 0 {
            return "Your plants are waiting for a sip 💧"
        } else if wateredCount == 1 {
            return "1 of your plants feels loved today ✨"
        } else {
            return "\(wateredCount) of your plants feel loved today ✨"
        }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 15) {
                // --- العنوان ---
                Text("My Plants 🌱")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top, 15)
                
                // --- خط فاصل بعد العنوان ---
                Divider()
                    .background(Color.gray.opacity(0.3))
                    .padding(.horizontal)

                // --- النص التحفيزي + progress bar (تم التعديل هنا) ---
                VStack(spacing: 10) {
                    Text(progressMessage) // استخدام الرسالة الديناميكية
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white) // تغيير اللون إلى الأبيض ليطابق الصورة
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    ZStack(alignment: .leading) {
                        // الخلفية الرمادية
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 8)
                        
                        // البار الأخضر مع التأثير
                        Capsule()
                            .fill(Color(red: 40/255, green: 224/255, blue: 168/255))
                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
                            .animation(.easeInOut, value: progress)
                    }
                    .frame(height: 8)
                }
                .padding(.horizontal)
                .padding(.bottom, 10)

                // --- قائمة النباتات ---
                List {
                    ForEach($viewModel.plants) { $plant in
                        PlantRowView(viewModel: viewModel, plant: $plant)
                            .listRowBackground(Color.black)
                            .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: viewModel.removePlant)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            
            // --- زر الإضافة ---
            Button(action: { showSetReminder = true }) {
                Image(systemName: "plus")
                    .font(.title.weight(.semibold))
                    .padding()
                    .background(Color(red: 40/255, green: 224/255, blue: 168/255))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding()
        }
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showSetReminder) {
            SetReminderView(
                plantListViewModel: viewModel,
                isPresented: $showSetReminder
            )
        }
    }
}

// MARK: - صف النبات الواحد
struct PlantRowView: View {
    @ObservedObject var viewModel: PlantListViewModel
    @Binding var plant: Plant
    @State private var showEditSheet = false
    
    private let lightYellowColor = Color(red: 204/255, green: 199/255, blue: 133/255)
    private let badgeBackgroundColor = Color(red: 24/255, green: 24/255, blue: 29/255)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top, spacing: 15) {
                Button(action: { plant.isSelected.toggle() }) {
                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(plant.isSelected ? Color(red: 40/255, green: 224/255, blue: 168/255) : .gray)
                }
                .buttonStyle(.plain)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "paperplane.fill")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("in \(plant.room.rawValue)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: { showEditSheet = true }) {
                        Text(plant.name)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.plain)
                    
                    HStack(spacing: 8) {
                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(lightYellowColor)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(badgeBackgroundColor)
                            .cornerRadius(8)
                        
                        Label(plant.waterAmount.rawValue, systemImage: "drop")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color(red: 173/255, green: 200/255, blue: 255/255))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                            .background(Color.white.opacity(0.08))
                            .cornerRadius(12)
                    }
                }
                Spacer()
            }
            .padding(.vertical, 8)
            
            Divider()
                .background(Color.gray.opacity(0.3))
                .padding(.leading, 50)
        }
        .sheet(isPresented: $showEditSheet) {
            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
        }
    }
}

// MARK: - Preview
struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView(viewModel: PlantListViewModel())
    }
}
