//import SwiftUI
//
//struct SwiftUIView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Content View")
//                    .font(.title)
//                
//                NavigationLink(destination: DetailView()) {
//                    Text("Go to Detail View")
//                }
//            }
//            .navigationBarTitle(Text("Parent Title")) // Judul utama navigasi
//        }
//    }
//}
//
//struct DetailView: View {
//    var body: some View {
//        VStack {
//            Text("Detail View")
//                .font(.title)
//        }
//        .navigationTitle(Text("Child Title"), displayMode: .inline) // Judul anak
//    }
//}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
