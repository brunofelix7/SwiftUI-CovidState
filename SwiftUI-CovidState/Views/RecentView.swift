import SwiftUI

struct RecentView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	@State var searchText = ""
	
	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		NavigationView {
			VStack {
				CardView(worldData: viewModel.worldData.first ?? WorldData())
				ListHeaderComponent()
				List {
					ForEach(viewModel.countryData.filter {
						self.searchText.isEmpty ? true :
						$0.country!.lowercased().contains(self.searchText.lowercased())
					}, id: \.country) {
						countryData in CountryDataRowView(country: countryData)
					}
				}.listStyle(PlainListStyle())
			}
			.navigationBarTitle("COVID-19 State", displayMode: .inline)
		}
	}
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
		RecentView(viewModel: .init())
    }
}
