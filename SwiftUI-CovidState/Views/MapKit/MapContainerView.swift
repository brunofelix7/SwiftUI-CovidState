import SwiftUI

struct MapContainerView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	
	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		MapView(countryData: viewModel.countryData)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
		MapContainerView(viewModel: .init())
    }
}
