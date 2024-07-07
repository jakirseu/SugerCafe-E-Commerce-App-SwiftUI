import SwiftUI

struct ThankYou: View {
    var body: some View {
        VStack{
            Text("😻")
                .font(.system(size: 100))
            Text("Thank you for your purchase! 🎉 We hope our Sugar will bring a little extra joy to your day. ")
            
            NavigationLink {
                ContentView()
            } label: {
                Text("Order more Sugar!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.pink)
                    .clipShape(Capsule())
            }
        }
        .navigationTitle("Thank you")
        .padding()
    }
}

#Preview {
    ThankYou()
}
