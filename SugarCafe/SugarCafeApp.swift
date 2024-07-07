import SwiftUI

@main
struct SugarCafeApp: App {
 
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CartManager())
        }
    }
}
