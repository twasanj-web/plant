

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
////            EditView(isPresented: $showEditSheet, plant: $plant)
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










//
//import SwiftUI
//
//// View: مسؤولة عن عرض قائمة النباتات وشريط التقدم
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showSetReminder = false
//
//    private var progress: Double {
//        guard !viewModel.plants.isEmpty else { return 0 }
//        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
//        return Double(wateredCount) / Double(viewModel.plants.count)
//    }
//
//    var body: some View {
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
//                List {
//                    ForEach($viewModel.plants) { $plant in
//                        // ✅ --- التعديل الأول هنا --- ✅
//                        // مرر الـ viewModel إلى PlantRowView
//                        PlantRowView(viewModel: viewModel, plant: $plant)
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
//    // ✅ --- التعديل الثاني هنا --- ✅
//    // اجعلها تستقبل الـ viewModel
//    @ObservedObject var viewModel: PlantListViewModel
//    
//    @Binding var plant: Plant
//    @State private var showEditSheet = false
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 15) {
//                // ... (الكود الداخلي يبقى كما هو)
//                Button(action: { plant.isSelected.toggle() }) {
//                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
//                        .font(.title2)
//                        .foregroundColor(plant.isSelected ? Color("g") : .gray)
//                }
//                .buttonStyle(.plain)
//                VStack(alignment: .leading, spacing: 8) {
//                    HStack(spacing: 4) {
//                        Image(systemName: "paperplane.fill").font(.caption).foregroundColor(.gray)
//                        Text(plant.room.rawValue).font(.subheadline).foregroundColor(.gray)
//                    }
//                    Button(action: { showEditSheet = true }) {
//                        Text(plant.name)
//                            .font(.title2).fontWeight(.bold).foregroundColor(.white)
//                    }
//                    .buttonStyle(.plain)
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
//        .sheet(isPresented: $showEditSheet) {
//            // ✅ --- التعديل الثالث هنا --- ✅
//            // مرر الـ viewModel إلى EditView
//            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
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


//
//
//import SwiftUI
//
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showSetReminder = false
//
//    private var progress: Double {
//        guard !viewModel.plants.isEmpty else { return 0 }
//        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
//        return Double(wateredCount) / Double(viewModel.plants.count)
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            Color.black.ignoresSafeArea()
//
//            VStack(alignment: .leading, spacing: 15) {
//                // --- العنوان ---
//                Text("My Plants 🌱")
//                    .font(.system(size: 34, weight: .bold))
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .padding(.top, 15)
//
//                // --- النص التحفيزي + progress bar ---
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Your plants are waiting for a sip 💧")
//                        .font(.system(size: 15))
//                        .foregroundColor(.gray)
//                    
//                    ZStack(alignment: .leading) {
//                        Capsule()
//                            .fill(Color.gray.opacity(0.3))
//                            .frame(height: 8)
//                        Capsule()
//                            .fill(Color("g"))
//                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
//                            .animation(.easeInOut, value: progress)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 10)
//
//                // --- قائمة النباتات ---
//                List {
//                    ForEach($viewModel.plants) { $plant in
//                        PlantRowView(viewModel: viewModel, plant: $plant)
//                            .listRowBackground(Color.black)
//                            .listRowSeparator(.hidden)
//                    }
//                    .onDelete(perform: viewModel.removePlant)
//                }
//                .listStyle(.plain)
//                .scrollContentBackground(.hidden)
//            }
//            
//            // --- زر الإضافة ---
//            Button(action: { showSetReminder = true }) {
//                Image(systemName: "plus")
//                    .font(.title.weight(.semibold))
//                    .padding()
//                    .background(Color("g"))
//                    .foregroundColor(.white)
//                    .clipShape(Circle())
//                    .shadow(radius: 5)
//            }
//            .padding()
//        }
//        .navigationBarHidden(true)
//        .preferredColorScheme(.dark)
//        .sheet(isPresented: $showSetReminder) {
//            SetReminderView(
//                plantListViewModel: viewModel,
//                isPresented: $showSetReminder
//            )
//        }
//    }
//}
//
//// MARK: - صف النبات الواحد
//struct PlantRowView: View {
//    @ObservedObject var viewModel: PlantListViewModel
//    @Binding var plant: Plant
//    @State private var showEditSheet = false
//    
//    // 🎨 ألوان مخصصة حسب التصميم
//    private let customYellow = Color(red: 204/255, green: 199/255, blue: 133/255)
//    private let customBlue = Color(red: 0/255, green: 94/255, blue: 243/255)
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            HStack(alignment: .top, spacing: 15) {
//                // ✅ زر التحديد
//                Button(action: { plant.isSelected.toggle() }) {
//                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
//                        .font(.title2)
//                        .foregroundColor(plant.isSelected ? Color("g") : .gray)
//                }
//                .buttonStyle(.plain)
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    // 🌍 موقع الغرفة
//                    HStack(spacing: 4) {
//                        Image(systemName: "paperplane.fill")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                        Text("in \(plant.room.rawValue)")
//                            .font(.system(size: 14))
//                            .foregroundColor(.gray)
//                    }
//                    
//                    // 🌿 اسم النبتة
//                    Button(action: { showEditSheet = true }) {
//                        Text(plant.name)
//                            .font(.system(size: 22, weight: .semibold))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(.plain)
//                    
//                    // 🌞 الضوء + 💧 كمية الماء
//                    HStack(spacing: 8) {
//                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(customYellow)
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 3)
//                            .background(Color.white.opacity(0.08))
//                            .cornerRadius(12)
//                        
//                        Label(plant.waterAmount.rawValue, systemImage: "drop")
//                            .font(.system(size: 14, weight: .medium))
//                            .foregroundColor(Color(red: 173/255, green: 200/255, blue: 255/255)) // 💧 اللون الأزرق الفاتح من الصورة
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 3)
//                            .background(Color.white.opacity(0.08))
//                            .cornerRadius(12)
//
//                    }
//                }
//                Spacer()
//            }
//            .padding(.vertical, 8)
//            
//            // --- الخط الفاصل بين النباتات ---
//            Divider()
//                .background(Color.gray.opacity(0.4))
//                .padding(.leading, 50)
//        }
//        .sheet(isPresented: $showEditSheet) {
//            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
//        }
//    }
//}
//
//// MARK: - Preview
//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantListView(viewModel: PlantListViewModel())
//    }
//}



//
//
//import SwiftUI
//
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showSetReminder = false
//
//    private var progress: Double {
//        guard !viewModel.plants.isEmpty else { return 0 }
//        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
//        return Double(wateredCount) / Double(viewModel.plants.count)
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            Color.black.ignoresSafeArea()
//
//            VStack(alignment: .leading, spacing: 15) {
//                // --- العنوان ---
//                Text("My Plants 🌱")
//                    .font(.system(size: 34, weight: .bold))
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .padding(.top, 15)
//                
//                // --- خط فاصل بعد العنوان ---
//                Divider()
//                    .background(Color.gray.opacity(0.3))
//                    .padding(.horizontal)
//
//                // --- النص التحفيزي + progress bar ---
//                VStack(spacing: 10) {
//                    Text("Your plants are waiting for a sip 💧")
//                        .font(.system(size: 15))
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                    
//                    ZStack(alignment: .leading) {
//                        // الخلفية الرمادية
//                        Capsule()
//                            .fill(Color.gray.opacity(0.3))
//                            .frame(height: 8)
//                        
//                        // البار الأخضر مع التأثير
//                        Capsule()
//                            .fill(Color(red: 40/255, green: 224/255, blue: 168/255))
//                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
//                            .animation(.easeInOut, value: progress)
//                    }
//                    .frame(height: 8)
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 10)
//
//                // --- قائمة النباتات ---
//                List {
//                    ForEach($viewModel.plants) { $plant in
//                        PlantRowView(viewModel: viewModel, plant: $plant)
//                            .listRowBackground(Color.black)
//                            .listRowSeparator(.hidden)
//                    }
//                    .onDelete(perform: viewModel.removePlant)
//                }
//                .listStyle(.plain)
//                .scrollContentBackground(.hidden)
//            }
//            
//            // --- زر الإضافة ---
//            Button(action: { showSetReminder = true }) {
//                Image(systemName: "plus")
//                    .font(.title.weight(.semibold))
//                    .padding()
//                    .background(Color(red: 40/255, green: 224/255, blue: 168/255))
//                    .foregroundColor(.white)
//                    .clipShape(Circle())
//                    .shadow(radius: 5)
//            }
//            .padding()
//        }
//        .navigationBarHidden(true)
//        .preferredColorScheme(.dark)
//        .sheet(isPresented: $showSetReminder) {
//            SetReminderView(
//                plantListViewModel: viewModel,
//                isPresented: $showSetReminder
//            )
//        }
//    }
//}
//
//// MARK: - صف النبات الواحد
//struct PlantRowView: View {
//    @ObservedObject var viewModel: PlantListViewModel
//    @Binding var plant: Plant
//    @State private var showEditSheet = false
//    
//    // 🎨 ألوان مخصصة حسب التصميم المطلوب
//    private let lightYellowColor = Color(red: 204/255, green: 199/255, blue: 133/255)
//    private let waterBlueColor = Color(red: 0/255, green: 94/255, blue: 243/255)
//    private let badgeBackgroundColor = Color(red: 24/255, green: 24/255, blue: 29/255)
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            HStack(alignment: .top, spacing: 15) {
//                // ✅ زر التحديد
//                Button(action: { plant.isSelected.toggle() }) {
//                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
//                        .font(.title2)
//                        .foregroundColor(plant.isSelected ? Color(red: 40/255, green: 224/255, blue: 168/255) : .gray)
//                }
//                .buttonStyle(.plain)
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    // 🌍 موقع الغرفة
//                    HStack(spacing: 4) {
//                        Image(systemName: "paperplane.fill")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                        Text("in \(plant.room.rawValue)")
//                            .font(.system(size: 14))
//                            .foregroundColor(.gray)
//                    }
//                    
//                    // 🌿 اسم النبتة
//                    Button(action: { showEditSheet = true }) {
//                        Text(plant.name)
//                            .font(.system(size: 22, weight: .semibold))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(.plain)
//                    
//                    // 🌞 الضوء + 💧 كمية الماء
//                    HStack(spacing: 8) {
//                        // Light Badge
//                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(lightYellowColor)
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 4)
//                            .background(badgeBackgroundColor)
//                            .cornerRadius(8)
//                        
//                        // Water Amount Badge
//                        Label(plant.waterAmount.rawValue, systemImage: "drop")
//                            .font(.system(size: 14, weight: .medium))
//                            .foregroundColor(waterBlueColor)
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 4)
//                            .background(badgeBackgroundColor)
//                            .cornerRadius(8)
//                    }
//                }
//                Spacer()
//            }
//            .padding(.vertical, 8)
//            
//            // --- الخط الفاصل بين النباتات ---
//            Divider()
//                .background(Color.gray.opacity(0.3))
//                .padding(.leading, 50)
//        }
//        .sheet(isPresented: $showEditSheet) {
//            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
//        }
//    }
//}
//
//// MARK: - Preview
//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantListView(viewModel: PlantListViewModel())
//    }
//}

//
//
//import SwiftUI
//
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showSetReminder = false
//
//    private var progress: Double {
//        guard !viewModel.plants.isEmpty else { return 0 }
//        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
//        return Double(wateredCount) / Double(viewModel.plants.count)
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            Color.black.ignoresSafeArea()
//
//            VStack(alignment: .leading, spacing: 15) {
//                // --- العنوان ---
//                Text("My Plants 🌱")
//                    .font(.system(size: 34, weight: .bold))
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .padding(.top, 15)
//                
//                // --- خط فاصل بعد العنوان ---
//                Divider()
//                    .background(Color.gray.opacity(0.3))
//                    .padding(.horizontal)
//
//                // --- النص التحفيزي + progress bar ---
//                VStack(spacing: 10) {
//                    Text("Your plants are waiting for a sip 💧")
//                        .font(.system(size: 15))
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                    
//                    ZStack(alignment: .leading) {
//                        // الخلفية الرمادية
//                        Capsule()
//                            .fill(Color.gray.opacity(0.3))
//                            .frame(height: 8)
//                        
//                        // البار الأخضر مع التأثير
//                        Capsule()
//                            .fill(Color(red: 40/255, green: 224/255, blue: 168/255))
//                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
//                            .animation(.easeInOut, value: progress)
//                    }
//                    .frame(height: 8)
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 10)
//
//                // --- قائمة النباتات ---
//                List {
//                    ForEach($viewModel.plants) { $plant in
//                        PlantRowView(viewModel: viewModel, plant: $plant)
//                            .listRowBackground(Color.black)
//                            .listRowSeparator(.hidden)
//                    }
//                    .onDelete(perform: viewModel.removePlant)
//                }
//                .listStyle(.plain)
//                .scrollContentBackground(.hidden)
//            }
//            
//            // --- زر الإضافة ---
//            Button(action: { showSetReminder = true }) {
//                Image(systemName: "plus")
//                    .font(.title.weight(.semibold))
//                    .padding()
//                    .background(Color(red: 40/255, green: 224/255, blue: 168/255))
//                    .foregroundColor(.white)
//                    .clipShape(Circle())
//                    .shadow(radius: 5)
//            }
//            .padding()
//        }
//        .navigationBarHidden(true)
//        .preferredColorScheme(.dark)
//        .sheet(isPresented: $showSetReminder) {
//            SetReminderView(
//                plantListViewModel: viewModel,
//                isPresented: $showSetReminder
//            )
//        }
//    }
//}
//
//// MARK: - صف النبات الواحد
//struct PlantRowView: View {
//    @ObservedObject var viewModel: PlantListViewModel
//    @Binding var plant: Plant
//    @State private var showEditSheet = false
//    
//    // 🎨 ألوان مخصصة حسب التصميم المطلوب
//    private let lightYellowColor = Color(red: 204/255, green: 199/255, blue: 133/255)
//    private let waterBlueColor = Color(red: 100/255, green: 150/255, blue: 255/255) // لون أزرق فاتح مشابه للصورة
//    private let badgeBackgroundColor = Color(red: 24/255, green: 24/255, blue: 29/255)
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            HStack(alignment: .top, spacing: 15) {
//                // ✅ زر التحديد
//                Button(action: { plant.isSelected.toggle() }) {
//                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
//                        .font(.title2)
//                        .foregroundColor(plant.isSelected ? Color(red: 40/255, green: 224/255, blue: 168/255) : .gray)
//                }
//                .buttonStyle(.plain)
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    // 🌍 موقع الغرفة
//                    HStack(spacing: 4) {
//                        Image(systemName: "paperplane.fill")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                        Text("in \(plant.room.rawValue)")
//                            .font(.system(size: 14))
//                            .foregroundColor(.gray)
//                    }
//                    
//                    // 🌿 اسم النبتة
//                    Button(action: { showEditSheet = true }) {
//                        Text(plant.name)
//                            .font(.system(size: 22, weight: .semibold))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(.plain)
//                    
//                    // 🌞 الضوء + 💧 كمية الماء
//                    HStack(spacing: 8) {
//                        // Light Badge
//                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(lightYellowColor)
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 4)
//                            .background(badgeBackgroundColor)
//                            .cornerRadius(8)
//                        
//                        // Water Amount Badge
//                        Label(plant.waterAmount.rawValue, systemImage: "drop.fill")
//                            .font(.system(size: 14, weight: .medium))
//                            .foregroundColor(waterBlueColor)
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 4)
//                            .background(badgeBackgroundColor)
//                            .cornerRadius(8)
//                    }
//                }
//                Spacer()
//            }
//            .padding(.vertical, 8)
//            
//            // --- الخط الفاصل بين النباتات ---
//            Divider()
//                .background(Color.gray.opacity(0.3))
//                .padding(.leading, 50)
//        }
//        .sheet(isPresented: $showEditSheet) {
//            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
//        }
//    }
//}
//
//// MARK: - Preview
//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantListView(viewModel: PlantListViewModel())
//    }
//}





//
//
//import SwiftUI
//
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showSetReminder = false
//
//    private var progress: Double {
//        guard !viewModel.plants.isEmpty else { return 0 }
//        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
//        return Double(wateredCount) / Double(viewModel.plants.count)
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            Color.black.ignoresSafeArea()
//
//            VStack(alignment: .leading, spacing: 15) {
//                // --- العنوان ---
//                Text("My Plants 🌱")
//                    .font(.system(size: 34, weight: .bold))
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .padding(.top, 15)
//                
//                // --- خط فاصل بعد العنوان ---
//                Divider()
//                    .background(Color.gray.opacity(0.3))
//                    .padding(.horizontal)
//
//                // --- النص التحفيزي + progress bar ---
//                VStack(spacing: 10) {
//                    Text("Your plants are waiting for a sip 💧")
//                        .font(.system(size: 15))
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                    
//                    ZStack(alignment: .leading) {
//                        // الخلفية الرمادية
//                        Capsule()
//                            .fill(Color.gray.opacity(0.3))
//                            .frame(height: 8)
//                        
//                        // البار الأخضر مع التأثير
//                        Capsule()
//                            .fill(Color(red: 40/255, green: 224/255, blue: 168/255))
//                            .frame(width: (UIScreen.main.bounds.width - 40) * CGFloat(progress), height: 8)
//                            .animation(.easeInOut, value: progress)
//                    }
//                    .frame(height: 8)
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 10)
//
//                // --- قائمة النباتات ---
//                List {
//                    ForEach($viewModel.plants) { $plant in
//                        PlantRowView(viewModel: viewModel, plant: $plant)
//                            .listRowBackground(Color.black)
//                            .listRowSeparator(.hidden)
//                    }
//                    .onDelete(perform: viewModel.removePlant)
//                }
//                .listStyle(.plain)
//                .scrollContentBackground(.hidden)
//            }
//            
//            // --- زر الإضافة ---
//            Button(action: { showSetReminder = true }) {
//                Image(systemName: "plus")
//                    .font(.title.weight(.semibold))
//                    .padding()
//                    .background(Color(red: 40/255, green: 224/255, blue: 168/255))
//                    .foregroundColor(.white)
//                    .clipShape(Circle())
//                    .shadow(radius: 5)
//            }
//            .padding()
//        }
//        .navigationBarHidden(true)
//        .preferredColorScheme(.dark)
//        .sheet(isPresented: $showSetReminder) {
//            SetReminderView(
//                plantListViewModel: viewModel,
//                isPresented: $showSetReminder
//            )
//        }
//    }
//}
//
//// MARK: - صف النبات الواحد
//struct PlantRowView: View {
//    @ObservedObject var viewModel: PlantListViewModel
//    @Binding var plant: Plant
//    @State private var showEditSheet = false
//    
//    // 🎨 ألوان مخصصة حسب التصميم المطلوب
//    private let lightYellowColor = Color(red: 204/255, green: 199/255, blue: 133/255)
//    private let badgeBackgroundColor = Color(red: 24/255, green: 24/255, blue: 29/255)
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            HStack(alignment: .top, spacing: 15) {
//                // ✅ زر التحديد
//                Button(action: { plant.isSelected.toggle() }) {
//                    Image(systemName: plant.isSelected ? "checkmark.circle.fill" : "circle")
//                        .font(.title2)
//                        .foregroundColor(plant.isSelected ? Color(red: 40/255, green: 224/255, blue: 168/255) : .gray)
//                }
//                .buttonStyle(.plain)
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    // 🌍 موقع الغرفة
//                    HStack(spacing: 4) {
//                        Image(systemName: "paperplane.fill")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                        Text("in \(plant.room.rawValue)")
//                            .font(.system(size: 14))
//                            .foregroundColor(.gray)
//                    }
//                    
//                    // 🌿 اسم النبتة
//                    Button(action: { showEditSheet = true }) {
//                        Text(plant.name)
//                            .font(.system(size: 22, weight: .semibold))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(.plain)
//                    
//                    // 🌞 الضوء + 💧 كمية الماء
//                    HStack(spacing: 8) {
//                        // Light Badge
//                        Label(plant.light.rawValue, systemImage: "sun.max.fill")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(lightYellowColor)
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 4)
//                            .background(badgeBackgroundColor)
//                            .cornerRadius(8)
//                        
//                        // Water Amount Badge (تم التعديل هنا)
//                        Label(plant.waterAmount.rawValue, systemImage: "drop")
//                            .font(.system(size: 14, weight: .medium))
//                            .foregroundColor(Color(red: 173/255, green: 200/255, blue: 255/255)) // 💧 اللون الأزرق الفاتح من الصورة
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 3)
//                            .background(Color.white.opacity(0.08))
//                            .cornerRadius(12)
//                    }
//                }
//                Spacer()
//            }
//            .padding(.vertical, 8)
//            
//            // --- الخط الفاصل بين النباتات ---
//            Divider()
//                .background(Color.gray.opacity(0.3))
//                .padding(.leading, 50)
//        }
//        .sheet(isPresented: $showEditSheet) {
//            EditView(viewModel: viewModel, isPresented: $showEditSheet, plant: $plant)
//        }
//    }
//}
//
//// MARK: - Preview
//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantListView(viewModel: PlantListViewModel())
//    }
//}

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
