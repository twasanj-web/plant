


import SwiftUI

struct SetReminderView: View {
    
    @StateObject private var viewModel = SetReminderViewModel()
    @ObservedObject var plantListViewModel: PlantListViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
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
                        
                        TextField("Enter name", text: $viewModel.plant.name)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // ✅ إضافة النبتة إلى القائمة
                        plantListViewModel.addPlant(viewModel.plant)
                        isPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color("g"))
                            .clipShape(Circle())
                    }
                }
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
