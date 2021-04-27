import SwiftUI

struct DisclaimerView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {

        VStack {
            
            SlideDownToCloseBar()
            
            VStack(alignment: .trailing) {
                
                Button("Close") {
                    withAnimation {
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 45,
                       maxHeight: 45,
                       alignment: .trailing)
                .padding(.trailing, 15)
                .foregroundColor(Color("darkGreen"))

            }
            
            Image(systemName: "doc.text.below.ecg")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color("darkGreen"))
                .frame(width: 25, height: 25)
                .padding()
                .cornerRadius(10)
                .overlay(Circle()
                            .stroke(Color("officialGreen"), lineWidth: 2))
                .shadow(radius: 10)
            
            Text("Disclaimer")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color("officialGreen"))
                .padding([.bottom, .top], 20)

            
            VStack(alignment: .leading) {
            
                Text("Thank you very much for using The Warranties App.")
                    .font(.system(size: 16))
                    .foregroundColor(Color("darkGreen"))
                    .foregroundColor(Color.white)
                    .padding()


            
                Text("The App was developed with the intent of helping you keep track of your warranties, setting reminders, adding photos and storing the information Cloud Based so you can see in multiple devices.")
                    .font(.system(size: 16))
                    .foregroundColor(Color("darkGreen"))
                    .foregroundColor(Color.white)
                    .padding()


                
                Text("Although The Warranties App DO create Reminders, it is not responsible to warn you about expiring warranties you might have.")
                    .font(.system(size: 16))
                    .foregroundColor(Color("darkGreen"))
                    .foregroundColor(Color.white)
                    .padding()


                
                Spacer()
                
            }
            
        }
        .padding()
        
        
        
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
