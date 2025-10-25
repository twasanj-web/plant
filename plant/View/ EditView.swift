
import SwiftUI


struct EditView: View {
    
    @Binding var isPresented: Bool
    @Binding var plant: Plant
    
    // إنشاء نسخة بسيطة من ViewModel فقط للحصول على خيارات الـ Enums
    var optionsViewModel = SetReminderViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 45) {
                    
                    // MARK: - Plant Name
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
                            .font(.system(size: 17))
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 20)
                    }
                    .frame(height: 59)
                    .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                    .cornerRadius(30)
                    .padding(.horizontal)
                    
                    // MARK: - Room & Light
                    VStack(spacing: 0) {
                        // Room
                        HStack {
                            // ✅ التعديل: استخدام Label أو Text/Image مباشرة
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
                        
                        // Light
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
                    
                    // MARK: - Watering
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
                    
                    // MARK: - Delete Button
                    Button(action: {
                        // لا يمكن الحذف من هنا مباشرة بدون تمرير دالة الحذف من PlantListViewModel
                        print("Delete Reminder Tapped - Action not fully implemented here")
                        isPresented = false
                    }) {
                        Text("Delete Reminder")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .contentShape(Rectangle())
                    }
                    .frame(width: 370, height: 52)
                    .background(Color.clear)
                    .shadow(color: Color.white.opacity(0.12), radius: 0, x: 0, y: 1)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 40)
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Edit Plant")
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
                        // لا نحتاج لـ saveReminder() لأن التعديلات تحدث مباشرة عبر @Binding
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
    EditView(isPresented: .constant(true), plant: .constant(Plant()))
}
