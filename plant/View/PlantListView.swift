

//
//import SwiftUI
//
//// View: مسؤولة عن عرض قائمة النباتات وشريط التقدم
//struct PlantListView: View {
//    
//    // ✅ التعديل الرئيسي: يجب أن تستقبل الـ ViewModel كـ ObservedObject لضمان استخدام نفس بيانات القائمة
//    @ObservedObject var viewModel: PlantListViewModel
//    
//    // إبقاء حالة عرض الشيت (sheet) هنا
//    @State private var showSetReminder = false
//
//    private var progress: Double {
//        guard !viewModel.plants.isEmpty else { return 0 }
//        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
//        return Double(wateredCount) / Double(viewModel.plants.count)
//    }
//
//    var body: some View {
//        // لا نحتاج لـ NavigationView هنا لأنها موجودة بالفعل في MyPlantsView
//        ZStack(alignment: .bottomTrailing) {
//            Color.black.edgesIgnoringSafeArea(.all)
//
//            VStack(alignment: .leading, spacing: 15) {
//                Text("My Plants🌱")
//                    .font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
//                    .padding([.horizontal, .top])
//
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Your plants are waiting for a sip 💧")
//                        .font(.subheadline).foregroundColor(.gray)
////                        .padding(.leading)
//                        
//
//                    ZStack(alignment: .leading) {
//                        Capsule().fill(Color.gray.opacity(0.3)).frame(height: 8)
//                        Capsule()
//                            .fill(Color("g"))
//                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
//                            .animation(.easeInOut, value: progress)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 10)
//
//                // ✅ تم إزالة منطق القائمة الفارغة بالكامل
//                List {
//                    ForEach($viewModel.plants) { $plant in
//                        // 1. ✅ تمرير plant كـ Binding إلى PlantRowView
//                        PlantRowView(plant: $plant)
//                            .listRowBackground(Color.black)
//                            .listRowSeparator(.hidden)
//                    }
//                    .onDelete(perform: viewModel.removePlant)
//                }
//                .listStyle(.plain)
//                .background(Color.black)
//            }
//            
//            Button(action: { showSetReminder = true }) {
//                Image(systemName: "plus")
//                    .font(.title.weight(.semibold)).padding()
//                    .background(Color("g")).foregroundColor(.white)
//                    .clipShape(Circle()).shadow(radius: 5)
//            }
//            .padding()
//        }
//        .navigationBarHidden(true)
//        .preferredColorScheme(.dark)
//        .sheet(isPresented: $showSetReminder) {
//            // ✅ تمرير الـ viewModel الصحيح إلى SetReminderView
//            SetReminderView(
//                plantListViewModel: viewModel,
//                isPresented: $showSetReminder
//            )
//        }
//    }
//}
//
//// عرض لصف واحد في القائمة (PlantRowView)
//struct PlantRowView: View {
//    @Binding var plant: Plant
//    @State private var showEditSheet = false // حالة لعرض شاشة التعديل
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 15) {
//                // زر الري (Checkbox)
//                Button(action: { plant.isSelected.toggle() }) {
//                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
//                        .font(.title2)
//                        .foregroundColor(plant.isSelected ? Color("g") : .gray)
//                }
//                .buttonStyle(.plain)
//
//                // باقي تفاصيل النبتة
//                VStack(alignment: .leading, spacing: 8) {
//                    HStack(spacing: 4) {
//                        Image(systemName: "paperplane.fill").font(.caption).foregroundColor(.gray)
//                        Text(plant.room.rawValue).font(.subheadline).foregroundColor(.gray)
//                    }
//                    
//                    // 2. ✅ زر النبتة لفتح شاشة التعديل
//                    Button(action: {
//                        showEditSheet = true
//                    }) {
//                        Text(plant.name)
//                            .font(.title2).fontWeight(.bold).foregroundColor(.white)
//                    }
//                    .buttonStyle(.plain) // لإزالة تأثير الزر الافتراضي
//                    
//                    HStack(spacing: 10) {
//                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
//                        Label(plant.waterAmount.rawValue, systemImage: "drop.fill")
//                    }
//                    .font(.caption)
//                    .foregroundColor(.white)
//                    .padding(.horizontal, 10).padding(.vertical, 5)
//                    .background(Color.white.opacity(0.1))
//                    .cornerRadius(20)
//                }
//                Spacer()
//            }
//            .padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.4)).padding(.leading, 50)
//        }
//        // 3. ✅ عرض شاشة التعديل كـ sheet
//        .sheet(isPresented: $showEditSheet) {
//            EditView(isPresented: $showEditSheet, plant: $plant)
//        }
//    }
//}
//
//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        // عند المعاينة، يجب تمرير نسخة من ViewModel
//        PlantListView(viewModel: PlantListViewModel())
//    }
//}


// PlantListView.swift

import SwiftUI

// View: مسؤولة عن عرض قائمة النباتات وشريط التقدم
struct PlantListView: View {
    
    @ObservedObject var viewModel: PlantListViewModel
    @State private var showSetReminder = false

    private var progress: Double {
        guard !viewModel.plants.isEmpty else { return 0 }
        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
        return Double(wateredCount) / Double(viewModel.plants.count)
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 15) {
                Text("My Plants🌱")
                    .font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                    .padding([.horizontal, .top])

                VStack(alignment: .leading, spacing: 8) {
                    Text("Your plants are waiting for a sip 💧")
                        .font(.subheadline).foregroundColor(.gray)

                    ZStack(alignment: .leading) {
                        Capsule().fill(Color.gray.opacity(0.3)).frame(height: 8)
                        Capsule()
                            .fill(Color("g"))
                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
                            .animation(.easeInOut, value: progress)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)

                List {
                    ForEach($viewModel.plants) { $plant in
                        // ✅ --- التعديل الأول هنا --- ✅
                        // مرر الـ viewModel إلى PlantRowView
                        PlantRowView(viewModel: viewModel, plant: $plant)
                            .listRowBackground(Color.black)
                            .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: viewModel.removePlant)
                }
                .listStyle(.plain)
                .background(Color.black)
            }
            
            Button(action: { showSetReminder = true }) {
                Image(systemName: "plus")
                    .font(.title.weight(.semibold)).padding()
                    .background(Color("g")).foregroundColor(.white)
                    .clipShape(Circle()).shadow(radius: 5)
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

// عرض لصف واحد في القائمة (PlantRowView)
struct PlantRowView: View {
    // ✅ --- التعديل الثاني هنا --- ✅
    // اجعلها تستقبل الـ viewModel
    @ObservedObject var viewModel: PlantListViewModel
    
    @Binding var plant: Plant
    @State private var showEditSheet = false
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                // ... (الكود الداخلي يبقى كما هو)
                Button(action: { plant.isSelected.toggle() }) {
                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(plant.isSelected ? Color("g") : .gray)
                }
                .buttonStyle(.plain)
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "paperplane.fill").font(.caption).foregroundColor(.gray)
                        Text(plant.room.rawValue).font(.subheadline).foregroundColor(.gray)
                    }
                    Button(action: { showEditSheet = true }) {
                        Text(plant.name)
                            .font(.title2).fontWeight(.bold).foregroundColor(.white)
                    }
                    .buttonStyle(.plain)
                    HStack(spacing: 10) {
                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
                        Label(plant.waterAmount.rawValue, systemImage: "drop.fill")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10).padding(.vertical, 5)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(20)
                }
                Spacer()
            }
            .padding(.vertical, 8)
            
            Divider().background(Color.gray.opacity(0.4)).padding(.leading, 50)
        }
        .sheet(isPresented: $showEditSheet) {
            // ✅ --- التعديل الثالث هنا --- ✅
            // مرر الـ viewModel إلى EditView
            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
        }
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        // عند المعاينة، يجب تمرير نسخة من ViewModel
        PlantListView(viewModel: PlantListViewModel())
    }
}
