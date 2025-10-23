//import SwiftUI
//
//struct SetReminder: View {
//    @Binding var showSheet: Bool
//    @State private var plantName: String = "Pothos"
//
//    var body: some View {
//        NavigationView {
//            VStack { // حاوية رئيسية تبدأ من الأعلى
//                
//                // --- حقل اسم النبتة ---
//                HStack {
//                    Text("Plant Name")
//                        .font(.system(size: 18, weight: .regular))
//                        .foregroundColor(.white)
//                        .opacity(0.99)
//                        .frame(width: 95, height: 22, alignment: .leading)
//                        .padding(.leading, 20)
//
//                    Rectangle()
//                        .fill(Color("g")) // تأكد من وجود هذا اللون في Assets
//                        .frame(width: 1, height: 24)
//                        .padding(.horizontal, 8)
//
//                    // --- تطبيق الخصائص الجديدة على هذا الحقل ---
//                    TextField("Enter name", text: $plantName)
//                        .font(.system(size: 17, weight: .regular)) // حجم الخط ووزنه
//                        .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255)) // لون النص
//                        .opacity(0.99) // الشفافية
//                    // -----------------------------------------
//                        .padding(.trailing, 20)
//                }
//                .frame(height: 59)
//                .background(Color(red: 44/255, green: 44/255, blue: 46/255))
//                .cornerRadius(30)
//                .padding(.horizontal) // مسافة أفقية من حواف الشاشة
//                .padding(.top, 40)    // المسافة العلوية الصحيحة
//
//                // Spacer يضمن أن بقية المساحة فارغة ويبقى الحقل في مكانه
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//            .background(Color.black.ignoresSafeArea())
//            .navigationTitle("Set Reminder")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button { showSheet = false } label: {
//                        Image(systemName: "xmark")
//                            .font(.title3)
//                            .foregroundColor(.white)
//                            .frame(width: 36, height: 36)
//                            .background(Color.black.opacity(0.6))
//                            .clipShape(Circle())
//                    }
//                }
//               
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button { showSheet = false } label: {
//                        Image(systemName: "checkmark")
//                            .font(.title3)
//                            .foregroundColor(.white)
//                            .frame(width: 36, height: 36)
//                            .background(Color("g"))
//                            .clipShape(Circle())
//                    }
//                }
//            }
//            .preferredColorScheme(.dark)
//        }
//    }
//}
//
//#Preview {
//    SetReminder(showSheet: .constant(true))
//}
