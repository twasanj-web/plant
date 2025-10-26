import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    // 1. طلب الإذن (لا تغيير هنا)
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS: Notification permission granted.")
            }
        }
    }
    
    // --- 2. دالة الإشعار المحلي البسيط ---
    // هذه الدالة ترسل إشعاراً واحداً بعد 5 ثوانٍ
    func scheduleSimpleTestNotification(plantName: String) {
        
        // --- المحتوى ---
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! You just added \(plantName). Let's water it! 🌱"
        content.sound = .default
        
        // --- المُحفّز (Trigger) ---
        // سيتم تشغيل الإشعار بعد 5 ثوانٍ من الآن. لا يوجد تكرار.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // --- الطلب (Request) ---
        let request = UNNotificationRequest(
            identifier: UUID().uuidString, // معرّف فريد وعشوائي
            content: content,
            trigger: trigger
        )
        
        // --- الإضافة إلى مركز الإشعارات ---
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling simple notification: \(error.localizedDescription)")
            } else {
                print("Simple notification scheduled successfully for \(plantName).")
            }
        }
    }
    
    /*
    // الكود السابق للجدولة المعقدة (تم وضعه في تعليق)
    func scheduleNotification(plantName: String, wateringDays: WateringDays) {
        // ... (الكود المعقد السابق)
    }
    */
}

