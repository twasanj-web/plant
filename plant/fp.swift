//
//
//import SwiftUI
//
//struct fp: View {
//    @State private var showSheet = false // متغير للتحكم في ظهور الشيت
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            
//            Text("My Plants 🌱")
//                .font(.title)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.top, 20)
//                .padding(.leading, 16)
//            
//            Divider()
//                .background(Color.white.opacity(0.5))
//                .padding(.horizontal, 16)
//            
//            Spacer()
//                .frame(height: 4)
//            
//            HStack {
//                Spacer()
//                Image("pp") // تأكد من وجود الصورة "pp" في Assets
//                    .padding(.top,100)
//                Spacer()
//            }
//            
//            Spacer()
//                .frame(height: 16) //مسافة بين الصورة والكلام
//            
//            HStack {
//                Text("Start your plant journey! ")
//                    .font(.system(size: 25, weight: .semibold))
//                    .foregroundColor(.white)
//                    .frame(width: 273, height: 30, alignment:.center)
//                    .multilineTextAlignment(.center)
//                    .padding(.leading,53)
//            }
//            
//            HStack {
//                Text("Now all your plants will be in one place and\nwe will help you take care of them :)🪴")
//                    .font(.system(size: 16, weight: .regular)) // SFPro-Regular
//                    .foregroundColor(Color(red: 159/255, green: 159/255, blue: 145/255))
//                    .opacity(0.7)
//                    .padding(.leading,40)
//                    .multilineTextAlignment(.center)
//            }
//            
//            Spacer()
//            
//            HStack {
//                Button("Set Plant Reminder") {
//                    showSheet = true // هذا هو الإجراء لفتح الشيت
//                }
//                .buttonStyle(.glassProminent)
//                .tint(.green)
//                .frame(width: 280, height: 44)
//                .font(.system(size: 17, weight: .semibold))
//                .foregroundColor(.white)
//                .padding(.leading,50)
//                .padding(.top, -180)
//               
//            }
//
//        }
//        .sheet(isPresented: $showSheet) { // هنا نستدعي الـ View المنفصلة للـ sheet
//            SetReminder(showSheet: $showSheet) // نمرر الـ Binding للتحكم في إغلاق الشيت
//        }
//        .preferredColorScheme(.dark) // لتعيين المظهر الداكن للصفحة الرئيسية أيضًا
//    }
//}
//
//#Preview {
//    fp()
//}
