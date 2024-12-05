/*
 Example from Paul Hudson's 100 days of SwiftUI
 */

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int16
    var label = ""
    var maximumRating: Int16 = 5
    var offIamge: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor  = Color.yellow
    
    var body: some View {
        
        HStack {
            
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(Array(1...Int(maximumRating)), id: \.self) { number in
                self.image(for: Int16(number))
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        self.rating = Int16(number)
                    }
            }
        }
    }
    
    func image(for number: Int16) -> Image {
        return number > rating ? offIamge ?? onImage : onImage
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
