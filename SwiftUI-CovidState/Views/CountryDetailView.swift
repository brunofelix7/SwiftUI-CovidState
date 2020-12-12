import SwiftUI

struct CountryDetailView: View {
	
	var countryData: CountryData
	
	init(countryData: CountryData) {
		self.countryData = countryData
	}
	
    var body: some View {
		VStack {
			VStack {
				CountryDetailRowView(
					number: formatNumber(number: countryData.confirmed) ?? "0",
					name: "Confirmed")
					.padding(.top)
				CountryDetailRowView(
					number: formatNumber(number: countryData.critical) ?? "0",
					name: "Critical",
					color: .yellow)
				CountryDetailRowView(
					number: formatNumber(number: countryData.deaths) ?? "0",
					name: "Deaths",
					color: .red)
				CountryDetailRowView(
					number: String(format: "%.2f", countryData.fatalityRate),
					name: "Deaths %",
					color: .red)
				CountryDetailRowView(
					number: formatNumber(number: countryData.recovered) ?? "0",
					name: "Recovered",
					color: .green)
				CountryDetailRowView(
					number: String(format: "%.2f", countryData.recoveredRate),
					name: "Recovered %",
					color: .green)
			}
			.background(Color("cardBackground"))
			.cornerRadius(8)
			.padding()
			
			Spacer()
		}
		.padding(.top, 50)
		.navigationBarTitle(countryData.country ?? "Country")
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
		CountryDetailView(countryData: .init())
			.colorScheme(.dark)
    }
}
