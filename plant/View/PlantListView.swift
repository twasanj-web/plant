//
//import SwiftUI
//
//struct PlantListView: View {
//    @StateObject var viewModel = PlantListViewModel()
//    @State private var progress: Double = 0.5 // قيمة افتراضية للتقدم
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    Text("My Plants🌱")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                    Spacer()
//                }
//                .padding(.horizontal)
//
//                // الخط الفاصل
//                Rectangle()
//                    .fill(Color.gray.opacity(0.5)) // لون رمادي فاتح للخط
//                    .frame(height: 1) // ارتفاع صغير للخط
//                    .padding(.horizontal) // مسافة أفقية للخط
//                    .padding(.vertical, 10) // مسافة رأسية حول الخط
//
//                Text("Your plants are waiting for a sip 💧")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                    .multilineTextAlignment(.center) // توسيط النص
//                    .padding(.horizontal)
//                    .padding(.bottom, 20)
//
//                // Progress Bar
//                ZStack(alignment: .leading) {
//                    Capsule()
//                        .fill(Color.gray.opacity(0.3))
//                        .frame(height: 10)
//
//                    Capsule()
//                        .fill(Color("g")) // استخدام اللون 'g' من Assets
//                        .frame(width: CGFloat(progress) * UIScreen.main.bounds.width * 0.9, height: 10)
//                        .animation(.easeInOut, value: progress)
//                }
//                .padding(.horizontal)
//
//                Spacer()
//
//                // زر الإضافة العائم
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            // هنا يمكن إضافة منطق الانتقال لصفحة إضافة نبات جديد
//                            print("Add Plant button tapped!")
//                        }) {
//                            Image(systemName: "plus")
//                                .font(.title.weight(.semibold))
//                                .padding()
//                                .background(Color("g")) // استخدام اللون 'g' من Assets
//                                .foregroundColor(.white)
//                                .clipShape(Circle())
//                                .shadow(radius: 4)
//                        }
//                        .padding(.trailing, 20)
//                        .padding(.bottom, 20)
//                    }
//                }
//            }
////            .background(Color.black.edgesIgnoringSafeArea(.all))
//            
//            .navigationBarHidden(true)
//            .preferredColorScheme(.dark)
//            
//           
//        }
//    }
//}
//
//struct PlantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantListView()
//    }
//}
//




import SwiftUI

struct PlantListView: View {
    @StateObject var viewModel = PlantListViewModel()
    @State private var showSetReminder = false

    private var progress: Double {
        guard !viewModel.plants.isEmpty else { return 0 }
        let wateredCount = viewModel.plants.filter { $0.isSelected }.count
        return Double(wateredCount) / Double(viewModel.plants.count)
    }

    var body: some View {
        NavigationView {
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

                    if viewModel.plants.isEmpty {
                        Spacer()
                        Text("No plants yet.\nTap the '+' button to add your first plant!")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        Spacer()
                    } else {
                        List {
                            ForEach($viewModel.plants) { $plant in
                                PlantRowView(plant: $plant)
                                    .listRowBackground(Color.black)
                                    .listRowSeparator(.hidden)
                            }
                            .onDelete(perform: viewModel.removePlant)
                        }
                        .listStyle(.plain)
                        .background(Color.black)
                    }
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
}

// عرض لصف واحد في القائمة
struct PlantRowView: View {
    @Binding var plant: Plant
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
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
                    
                    Text(plant.name)
                        .font(.title2).fontWeight(.bold).foregroundColor(.white)
                    
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
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
