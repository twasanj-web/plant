
import SwiftUI

// تعريف لون الزر الأخضر الفاتح لسهولة الاستخدام
extension Color {
    static let neonGreen = Color(red: 102/255, green: 254/255, blue: 208/255)
    static let sheetBackground = Color(red: 15/255, green: 17/255, blue: 16/255)
}

// View: مسؤولة عن عرض واجهة "ضبط التذكير"
struct SetReminderView: View {
    
    @StateObject private var viewModel = SetReminderViewModel()
    @ObservedObject var plantListViewModel: PlantListViewModel
    @Binding var isPresented: Bool
    
    // سيحدد هذا المتغير ما إذا كان يجب حذف النباتات القديمة أم لا
    var shouldClearPreviousPlants: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background with rounded corners
                Color.sheetBackground
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 45) {
                        
                        // --- حقل اسم النبتة ---
                        HStack {
                            Text("Plant Name")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            
                            Rectangle()
                                .fill(Color("g"))
                                .frame(width: 1, height: 24)
                                .padding(.horizontal, 8)
                            
                            TextField("Pothos", text: $viewModel.plant.name)
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(Color("g"))
                                .padding(.trailing, 20)
                        }
                        .frame(height: 59)
                        .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                        .cornerRadius(30)
                        .padding(.horizontal)
                        
                        // --- Room + Light ---
                        VStack(spacing: 0) {
                            HStack {
                                Label("Room", systemImage: "location")
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Picker("", selection: $viewModel.plant.room) {
                                    ForEach(viewModel.roomOptions, id: \.self) { room in
                                        Text(room.rawValue).tag(room)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .padding(.vertical, 3)
                            .padding(.horizontal)
                            
                            Divider().background(Color.gray.opacity(0.5)).padding(.horizontal)
                            
                            HStack {
                                Label("Light", systemImage: "sun.max")
                                    .foregroundColor(.white)
                                    
                                Spacer()
                                    
                                Picker("", selection: $viewModel.plant.light) {
                                    ForEach(viewModel.lightOptions, id: \.self) { light in
                                        Text(light.rawValue).tag(light)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .padding(.vertical, 3)
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 10)
                        .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                        .cornerRadius(30)
                        .padding(.horizontal)
                        
                        // --- Watering Days + Amount ---
                        VStack(spacing: 0) {
                            
                            // Watering Days
                            HStack {
                                Label("Watering Days", systemImage: "drop")
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Picker("", selection: $viewModel.plant.wateringDays) {
                                    ForEach(viewModel.wateringDaysOptions, id: \.self) { days in
                                        Text(days.rawValue).tag(days)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .padding(.vertical, 3)
                            .padding(.horizontal)

                            Divider().background(Color.gray.opacity(0.5)).padding(.horizontal)
                            
                            // Water Amount
                            HStack {
                                Label("Water Amount", systemImage: "drop")
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Picker("", selection: $viewModel.plant.waterAmount) {
                                    ForEach(viewModel.waterAmountOptions, id: \.self) { amount in
                                        Text(amount.rawValue).tag(amount)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .padding(.vertical, 3)
                            .padding(.horizontal)
                            
                        }
                        .padding(.vertical, 10)
                        .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                        .cornerRadius(30)
                        .padding(.horizontal)

                        Spacer()
                    }
                    .padding(.top, 40)
                }
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // --- X BUTTON (Simple Original Style) ---
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { isPresented = false } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
                // --- END X BUTTON ---
                
                // --- CHECKMARK BUTTON (Simple Style with Green Color) ---
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // أولاً، تحقق مما إذا كان يجب حذف النباتات القديمة
                        if shouldClearPreviousPlants {
                            plantListViewModel.removeAllPlants()
                        }
                        
                        // ثانياً، أضف النبتة الجديدة
                        plantListViewModel.addPlant(viewModel.plant)
                        
                        // ثالثاً، قم بجدولة الإشعار
                        NotificationManager.shared.scheduleSimpleTestNotification(
                            plantName: viewModel.plant.name
                        )
                        
                        // رابعاً، أغلق الشاشة
                        isPresented = false
                        
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.neonGreen)
                            .clipShape(Circle())
                    }
                    .disabled(viewModel.plant.name.isEmpty)
                }
                // --- END CHECKMARK BUTTON ---
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    SetReminderView(
        plantListViewModel: PlantListViewModel(),
        isPresented: .constant(true)
    )
}
