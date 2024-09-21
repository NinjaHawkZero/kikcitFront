
import SwiftUI

// The image variable is where we'll save the selected image and pass it to our imagePicker.  The second state, showSheet, will be toggled to show the ImagePicker as a sheet, on top of your view.

struct ImageUploadView: View {
    @State private var showSheet = false
    @EnvironmentObject var createViewModel: CreateBusinessVM
    var userID = defaults.string(forKey: "userID")
    var body: some View {
        VStack {
            // Button user will tap to show image picker
            Text("Add Your Business Logo")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(width: 150, height: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.kickitOrange), Color(.kickitOrange)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(16)
                .foregroundColor(.white)
                .onTapGesture {
                    showSheet = true
                }
            // Add image to view so the user can preview the image they selected
            Image(uiImage: createViewModel.image ?? UIImage())
                .resizable()
                .cornerRadius(50)
                .padding(.all, 4)
                .frame(width: 200, height: 200)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Rectangle())
                .padding(8)
            Button(action: {
                guard let id = userID, !id.isEmpty else {
                  
                    return
                }

                createViewModel.uploadImage()
            }, label: {
                Text("Upload New Image").foregroundStyle(.kickitOrange)
            })
        }.sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $createViewModel.image)
        }
        .padding()
    }
}

#Preview {
    ImageUploadView()
        .environmentObject(CreateBusinessVM())
}
