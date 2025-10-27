


import SwiftUI

// View: مسؤولة عن عرض واجهة "تحرير النبتة"
struct EditView: View {
    
    @ObservedObject var viewModel: PlantListViewModel
    
    @Binding var isPresented: Bool
    @Binding var plant: Plant
    
    var optionsViewModel = SetReminderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background with rounded corners
                Color(red: 15/255, green: 17/255, blue: 16/255)
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
                            
                            TextField("Enter name", text: $plant.name)
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
                                
                                Picker("", selection: $plant.room) {
                                    ForEach(optionsViewModel.roomOptions, id: \.self) { room in
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
                                    
                                Picker("", selection: $plant.light) {
                                    ForEach(optionsViewModel.lightOptions, id: \.self) { light in
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
                                
                                Picker("", selection: $plant.wateringDays) {
                                    ForEach(optionsViewModel.wateringDaysOptions, id: \.self) { days in
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
                                
                                Picker("", selection: $plant.waterAmount) {
                                    ForEach(optionsViewModel.waterAmountOptions, id: \.self) { amount in
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

                        // --- Delete Button ---
                        Button(action: {
                            viewModel.removePlant(plant)
                            isPresented = false
                        }) {
                            Text("Delete Reminder")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .contentShape(Rectangle())
                        }
                        .frame(height: 52)
                        .background(Color(red: 28/255, green: 30/255, blue: 29/255))
                        .cornerRadius(30)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.top, 40)
                }
            }
            .navigationTitle("Edit Plant")
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
                        isPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color(red: 102/255, green: 254/255, blue: 208/255))
                            .clipShape(Circle())
                    }
                }
                // --- END CHECKMARK BUTTON ---
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    EditView(
        viewModel: PlantListViewModel(),
        isPresented: .constant(true),
        plant: .constant(Plant())
    )
}
