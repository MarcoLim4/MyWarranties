//
//  LifeSpanView.swift
//  MyGuitars
//
//  Created by Marco Lima on 2021-03-01.
//

import SwiftUI

struct LifeSpanView: View {

    @Binding var lifespan: Int16

    var label = ""
    var maximumRating: Int16 = 6
    let images = [Image(systemName: "2.square")]
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
                    .foregroundColor(number > lifespan ? offColor : onColor)
                    .onTapGesture {
                        self.lifespan = Int16(number)
                    }
            }
        }

    }


    func image(for number: Int16) -> Image {

        return number > lifespan
        ?  offIamge ?? Image(systemName: "\(number * 2).square")
        : Image(systemName: "\(number * 2).square")

    }
}

struct LifeSpanView_Previews: PreviewProvider {
    static var previews: some View {
        LifeSpanView(lifespan: .constant(4))
    }
}
