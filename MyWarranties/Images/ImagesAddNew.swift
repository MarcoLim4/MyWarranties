import SwiftUI

struct ImagesAddNew: View {

    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {

        VStack {

            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
                self.showingImagePicker = true                
            }

        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(source: PhotoSource.library, image: self.$inputImage)
        }
    }
}

struct ImagesAddNew_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAddNew()
    }
}
