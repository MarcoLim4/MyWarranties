import SwiftUI

struct DefaultValuesView: View {
    
    @Environment(\.presentationMode) var presentation
    @State private var reminderNotice = "5 Days"
    
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
            
            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color("darkGreen"))
                .frame(width: 25, height: 18)
                .padding()
                .cornerRadius(10)
                .overlay(Circle()
                    .stroke(Color("officialGreen"), lineWidth: 2))
                .shadow(radius: 10)
            
            Text("Notice Reminders")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color("officialGreen"))
                .padding([.bottom, .top], 20)
            
            
            Text("Set how far in advance you want to receive the expiry notice Reminder.")
                .font(.system(size: 16))
                .foregroundColor(Color("darkGreen"))
                .foregroundColor(Color.white)
                .padding([.leading, .trailing, .horizontal])
            
            
            HStack {
                
                Picker("Notice Reminder", selection: $reminderNotice) {
                    
                    ForEach(Products().warrantyReminderNoticeTypes, id: \.self) { notice in
                        
                        Text(notice)
                            .font(.system(size: 20))
                            .foregroundColor(Color("officialGreen"))
                        
                        
                    }
                    .foregroundColor(.gray)
                    
                    
                }
                .pickerStyle(WheelPickerStyle())
                .padding([.leading, .trailing, .horizontal])
                
            }
            .padding([.leading, .trailing, .horizontal])
            
            Spacer()
            
        }
        .padding()
        .onAppear(perform: {
            self.reminderNotice = UserDefaults.standard.string(forKey: Constants.DefaultKeys.warrantyNotice.rawValue) ?? "5 Days"
        })
        .onDisappear(perform: {    
            UserDefaults.standard.set(self.reminderNotice as String, forKey: Constants.DefaultKeys.warrantyNotice.rawValue)
        })
        
    }
    
    
    
    
    
}

struct DefaultValuesView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultValuesView()
    }
}
