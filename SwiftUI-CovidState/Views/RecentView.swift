import SwiftUI

struct RecentView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	@State var searchText = ""
	@State var isSearchVisible = false
	
	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		NavigationView {
			VStack {
				if isSearchVisible {
					SearchView(searchText: $searchText)
				}
				
				CardView(
					worldData: viewModel.worldData.first ?? WorldData())
				
				HeaderView()
				
				List {
					ForEach(viewModel.countryData.filter {
						self.searchText.isEmpty ? true :
						$0.country!.lowercased().contains(self.searchText.lowercased())
					}, id: \.country) { countryData in
						NavigationLink(
							destination: CountryDetailView(countryData: countryData)) {
							CountryDataRowView(country: countryData)
						}
					}
				}.listStyle(PlainListStyle())
			}
			.navigationBarTitle("COVID-19 State",
								displayMode: .inline)
			.navigationBarItems(
				trailing: Button(
					action: {
						self.isSearchVisible.toggle()
						if !self.isSearchVisible {
							self.searchText = ""
						}
					}, label: {
						Image(systemName: "magnifyingglass")
					}))
		}
	}
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
		RecentView(viewModel: .init()).colorScheme(.dark)
    }
}
