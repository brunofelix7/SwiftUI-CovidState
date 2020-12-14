import SwiftUI

struct CountryDetailView: View {
	
	@ObservedObject var viewModel: DataStatisticsViewModel
	var countryName: String
	
	init(viewModel: DataStatisticsViewModel, countryName: String) {
		self.viewModel = viewModel
		self.countryName = countryName
	}
	
    var body: some View {
		VStack {
			VStack {
				CountryDetailRowView(
					number: formatNumber(number: viewModel.detailedCountryData.confirmedCases) ?? "0",
					name: "Confirmed")
					.padding(.top)
				CountryDetailRowView(
					number: formatNumber(number: viewModel.detailedCountryData.activeCases) ?? "0",
					name: "Active Cases")
				CountryDetailRowView(
					number: "+" + (formatNumber(number: viewModel.detailedCountryData.newCases) ?? "0"),
					name: "New Cases")
				CountryDetailRowView(
					number: formatNumber(number: viewModel.detailedCountryData.recoveredCases) ?? "0",
					name: "Recovered Cases",
					color: .green)
				CountryDetailRowView(
					number: formatNumber(number: viewModel.detailedCountryData.criticalCases) ?? "0",
					name: "Critical Cases",
					color: .yellow)
				CountryDetailRowView(
					number: formatNumber(number: viewModel.detailedCountryData.deaths) ?? "0",
					name: "Deaths",
					color: .red)
				CountryDetailRowView(
					number: "+" + (formatNumber(number: viewModel.detailedCountryData.newDeaths) ?? "0"),
					name: "New deaths",
					color: .red)
				CountryDetailRowView(
					number: "+" + (formatNumber(number: viewModel.detailedCountryData.testsDone) ?? "0"),
					name: "Tests done",
					color: .yellow)
				CountryDetailRowView(
					number: String(format: "%.2f", viewModel.detailedCountryData.fatalityRate) + "%",
					 name: "Fatality rate",
					 color: .red)
				CountryDetailRowView(
					number: String(format: "%.2f", viewModel.detailedCountryData.recoveredRate) + "%",
					 name: "Recovered rate",
					 color: .green)
			}
			.background(Color("cardBackground"))
			.cornerRadius(4)
			.padding()
			
			Spacer()
		}
		.padding(.top, 25)
		.navigationBarTitle(countryName)
		.onAppear() {
			//	Executa toda vez que a view aparece
			self.getStatistics()
		}
    }
	
	private func getStatistics() {
		self.viewModel.fetchStateByCountry(country: countryName)
	}
}
