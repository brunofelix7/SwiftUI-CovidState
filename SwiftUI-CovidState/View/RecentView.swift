import SwiftUI

struct RecentView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	
	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
        Text("Hello, World!")
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
		RecentView(viewModel: .init())
    }
}
