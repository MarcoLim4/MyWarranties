import SwiftUI

struct SlideDownToCloseBar: View {

    var body: some View {

        VStack(alignment: .center) {
            Rectangle()
                .frame(width: 130, height: 5)
                .cornerRadius(20.0)
                .padding(.zero)
                .foregroundColor(Color("darkGray"))
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)

        }
        .padding(.zero)


    }
}

struct SlideDownToCloseBar_Previews: PreviewProvider {
    static var previews: some View {
        SlideDownToCloseBar()
    }
}
