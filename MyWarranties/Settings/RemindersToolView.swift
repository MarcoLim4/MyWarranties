import SwiftUI
import CoreData


struct RemindersToolView: View {
    
    @Environment(\.presentationMode) var presentation
    @State private var isShowingDeleteMessage = false
    @EnvironmentObject var dataController: DataController
    
    let products : FetchRequest<Products>
    
    init() {

        let request: NSFetchRequest<Products> = Products.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.productName, ascending: false)]
        products = FetchRequest(fetchRequest: request)
    
    }
    
    
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
            
            Image(systemName: "calendar.badge.minus")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color("darkGreen"))
                .frame(width: 25, height: 25)
                .padding(.all, 10)
                .cornerRadius(10)
                .overlay(Circle()
                            .stroke(Color("officialGreen"), lineWidth: 2))
                .shadow(radius: 10)
            
            Text("Reminders Tool")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color("officialGreen"))
                .padding([.bottom, .top], 20)
            
            VStack(alignment: .leading) {
            
            
                Text("By executing this option, the Application will iterate through the database and remove all the Reminders that were created.")
                    .font(.system(size: 16))
                    .foregroundColor(Color("darkGreen"))
                    .foregroundColor(Color.white)
                    .padding([.leading, .trailing, .horizontal])

                Text("It will uncheck the 'Add/Remove Reminder' for both normal and extended waranties and also, try to find the items in the Reminders App and remove them.")
                    .font(.system(size: 16))
                    .foregroundColor(Color("darkGreen"))
                    .foregroundColor(Color.white)
                    .padding()


                Button(action: {
                    isShowingDeleteMessage.toggle()
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "bell.slash")
                        Text("Clear All Reminders")
                    }
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 45,
                       maxHeight: 45,
                       alignment: .center)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10.0)
                .shadow(radius: 5)
                .padding([.leading, .trailing, .top], 15)

                .alert(isPresented: $isShowingDeleteMessage) {

                    Alert(
                        title: Text("Are you sure?"),
                        message: Text("By executing this option, the Application will iterate through the database and remove all the Reminders that were created."),
                        primaryButton: .destructive(Text("Please, go ahead!")) {

                            self.deleteAllReminders()
                            dataController.save()                            
                            self.presentation.wrappedValue.dismiss()

                        },
                        secondaryButton: .cancel()
                    )


                }


                
                Spacer()
                
            }
            
        }
        .padding()
        
    }
    
    func deleteAllReminders() {
        
        for product in products.wrappedValue {
            
            if let regularReminder = product.warrantyReminderID {
                
                product.warrantyReminderID   = ""
                product.warrantyShowReminder = false
                
                WarrantiesReminders.removeReminder(reminderID: regularReminder) { _ in
                    
                }
                
            }

            if let extendedReminder = product.extendedReminderID {
                
                product.extendedReminderID   = ""
                product.extendedShowRemider = false
                
                WarrantiesReminders.removeReminder(reminderID: extendedReminder) { _ in
                    
                }
                
            }

            
        }
        
    }
    
}

struct RemindersToolView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersToolView()
    }
}
