
import SwiftUI

//================================================
//  ملف: EditView.swift
//  المجلد: Views
//  الغرض: هذا هو الـ View (واجهة المستخدم) لتعديل التذكير
//================================================

struct EditView: View {
    
    @StateObject private var viewModel = SetReminderViewModel()
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
                            .fill(Color("g")) // تأكد من وجود هذا اللون في Assets
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
                    
                    
                    // --- حقلي الغرفة والإضاءة ---
                    VStack(spacing: 0) {
                        // --- صف الغرفة (Room) ---
                        ZStack {
                            HStack {
                                Image(systemName: "paperplane")
                                    .foregroundColor(.white)
                                Text("Room")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(viewModel.plant.room.rawValue)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                                Image(systemName: "chevron.up.chevron.down")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .font(.system(size: 18, weight: .regular))
                            .padding(.horizontal, 20)
                            
                            Picker("", selection: $viewModel.plant.room) {
                                ForEach(viewModel.roomOptions, id: \.self) { room in
                                    Text(room.rawValue).tag(room)
                                }
                            }
                            .pickerStyle(.menu)
                            .opacity(0.02) // حيلة لجعل الصف قابلاً للنقر
                        }
                        
                        Divider().background(Color.gray.opacity(0.5)).padding(.horizontal)
                        
                        // --- صف الإضاءة (Light) ---
                        ZStack {
                            HStack {
                                Image(systemName: "sun.max")
                                    .foregroundColor(.white)
                                Text("Light")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(viewModel.plant.light.rawValue)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                                Image(systemName: "chevron.up.chevron.down")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .font(.system(size: 18, weight: .regular))
                            .padding(.horizontal, 20)
                            
                            Picker("", selection: $viewModel.plant.light) {
                                ForEach(viewModel.lightOptions, id: \.self) { light in
                                    Text(light.rawValue).tag(light)
                                }
                            }
                            .pickerStyle(.menu)
                            .opacity(0.02)
                        }
                    }
                    .frame(height: 95)
                    .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                    .cornerRadius(30)
                    .padding(.horizontal)
                    
                    
                    // --- قسم الري (Watering) ---
                    VStack(spacing: 0) {
                        // --- صف أيام الري (Watering Days) ---
                        ZStack {
                            HStack {
                                Image(systemName: "drop")
                                    .foregroundColor(.white)
                                Text("Watering Days")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(viewModel.plant.wateringDays.rawValue)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                                Image(systemName: "chevron.up.chevron.down")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .font(.system(size: 18, weight: .regular))
                            .padding(.horizontal, 20)
                            
                            Picker("", selection: $viewModel.plant.wateringDays) {
                                ForEach(viewModel.wateringDaysOptions, id: \.self) { days in
                                    Text(days.rawValue).tag(days)
                                }
                            }
                            .pickerStyle(.menu)
                            .opacity(0.02)
                        }
                        
                        Divider().background(Color.gray.opacity(0.5)).padding(.horizontal)
                        
                        // --- صف كمية الماء (Water Amount) ---
                        ZStack {
                            HStack {
                                Image(systemName: "drop")
                                    .foregroundColor(.white)
                                Text("Water Amount")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(viewModel.plant.waterAmount.rawValue)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                                Image(systemName: "chevron.up.chevron.down")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                            }
                            .font(.system(size: 18, weight: .regular))
                            .padding(.horizontal, 20)
                            
                            Picker("", selection: $viewModel.plant.waterAmount) {
                                ForEach(viewModel.waterAmountOptions, id: \.self) { amount in
                                    Text(amount.rawValue).tag(amount)
                                }
                            }
                            .pickerStyle(.menu)
                            .opacity(0.02)
                        }
                    }
                    .frame(height: 95)
                    .background(Color(red: 44/255, green: 44/255, blue: 46/255))
                    .cornerRadius(30)
                    .padding(.horizontal)

                    // --- زر الحذف (بالحجم والتصميم الجديد) ---
                    Button(action: {
                        // أضف هنا الإجراء الذي سيتم عند الضغط على زر الحذف
                        print("Delete Reminder Tapped")
                        isPresented = false // لإغلاق الواجهة كمثال
                    }) {
                        Text("Delete Reminder")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .contentShape(Rectangle()) // لجعل المساحة كلها قابلة للنقر
                    }
                    .frame(width: 370, height: 52) // تحديد حجم الزر
                    .background(Color.clear) // خلفية شفافة
                    .shadow(color: Color.white.opacity(0.12), radius: 0, x: 0, y: 1) // إضافة الظل السفلي
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
                        viewModel.saveReminder()
                        isPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color("g")) // تأكد من وجود هذا اللون في Assets
                            .clipShape(Circle())
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    EditView(isPresented: .constant(true))
}

