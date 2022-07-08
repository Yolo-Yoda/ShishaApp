import SwiftUI

struct GoogleView: View {
    var body: some View {
        Button(action: {
            // do somethingOn Google
        }, label: {
            HStack {
                Image("GooglePhoto")
                    .frame(width: 24, height: 24)
                    .cornerRadius(12)
                Text("Продолжить с Google")
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color.black)
            }
            .frame(width: 281, height: 53)
            .background(Color("Gray245"))
            .cornerRadius(5)
        })
    }
}

struct GoogleView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleView()
    }
}
