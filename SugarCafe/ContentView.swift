import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var cart: CartManager
    let products = Product.all()
    
    var body: some View {
        
        NavigationStack {
            VStack{
                List(products) { product in
                    HStack{
                        Text(product.photo)
                            .font(.system(size: 50))
                        VStack(alignment: .leading){
                            Text(product.name)
                                .font(.title3)
                            Text("Price: " + String(format: "%.2f", product.price))
                                .font(.callout)
                        }
                        Spacer()
                        Button {
                            cart.addToCart(product)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                
            }
            .navigationTitle("Welcome to Suger Cafe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView()
                    } label: {
                        
                        ZStack(alignment: .topTrailing){
                            Image(systemName: "cart")
                                .padding(.top, 5)
                            
                            if cart.cartCount > 0{
                                Text("\(cart.cartCount)")
                                    .font(.caption2).bold()
                                    .foregroundColor(.white)
                                    .frame(width: 15, height: 15)
                                    .background(.red)
                                    .cornerRadius(50)
                                
                            }
                        }
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
