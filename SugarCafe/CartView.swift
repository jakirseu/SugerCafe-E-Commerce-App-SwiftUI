import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartManager
    
    @ObservedObject var model = PaymentManager()
    
    var body: some View {
        ScrollView {
            if cart.cartCount > 0 {
                ForEach(cart.cartItems.sorted(by: { $0.key.id < $1.key.id }), id: \.key) { product, key in
                    HStack {
                        Text(product.photo)
                            .font(.system(size: 50))
                        VStack(alignment: .leading){
                            Text(product.name)
                                .font(.title3)
                            Text("Price: " + String(format: "%.2f", product.price))
                                .font(.callout)
                        }
                        Spacer()
                        Button(action: {
                            cart.addToCart(product)
                        }, label: {
                            Image(systemName: "plus")
                        })
                        
                        Button(action: {
                            cart.removeFromCart(product: product)
                        }, label: {
                            Image(systemName: "minus")
                        })
                        
                        Text("\(key)")
                            .font(.title)
                            .bold()
                    }
                    .padding()
                }
                NavigationLink {
                    CheckoutView()
                } label: {
                    Text("Proceed to checkout")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                }
                
            } else{
                Text("Your cart is empty. Go back and add some suger to your life!")
            }
        }
        .padding(10)
        .navigationTitle("Cart Review")
    }
}


