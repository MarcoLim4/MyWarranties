import SwiftUI

struct ProductsImagesRow: View {

    let layout = [GridItem(.flexible(minimum : 80))]
    @State private var showingImageView = false
    
    let thePhotos: [Photos]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        
        ScrollView(.horizontal) {

            LazyHGrid(rows: layout, spacing: 20) {

                ForEach(Array(thePhotos.enumerated()), id: \.offset) { index, photoItem in

                    let instPhoto = UIImage(data: photoItem.itemPhoto ?? Data()) ?? UIImage(named: "image05.png")
                    
                    ZStack(alignment: .center) {
                        
                        Image(uiImage: instPhoto ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80.0, height: 80.0, alignment: .center)
                            .clipShape(Circle())
                            .shadow(radius: 8)

                        Button(action: {
                            self.selectedIndex    = index
                            self.showingImageView = true
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.green)
                        }
                        .frame(width: 80.0, height: 80.0, alignment: .center)

                    }
                    .sheet(isPresented: $showingImageView, content: {
                        withAnimation {
                            ImagesShowImageView(photo: thePhotos[selectedIndex])
                        }                        
                    })

                }

            }
            .padding(.horizontal)

        }
        
    }
    
}

struct InstrumentsImagesRow_Previews: PreviewProvider {
        
    static var previews: some View {
        ProductsImagesRow(thePhotos: Products.photosSample)
    }
}
