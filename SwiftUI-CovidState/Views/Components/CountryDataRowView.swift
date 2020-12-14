import SwiftUI

struct CountryDataRowView: View {
	
	var country: CountryData
	
	init(country: CountryData) {
		self.country = country
	}
	
    var body: some View {
		HStack {
			TextRowView(text: country.country ?? "-")
				.frame(width: 100, height: 40, alignment: .leading)
			Spacer()
			TextRowView(text: formatNumber(number: country.confirmed) ?? "-")
				.frame(height: 40, alignment: .trailing)
			Spacer()
			TextRowView(text: formatNumber(number: country.deaths) ?? "-")
				.frame(height: 40, alignment: .trailing)
				.foregroundColor(Color.red)
			Spacer()
			TextRowView(text: formatNumber(number: country.recovered) ?? "-")
				.frame(height: 40, alignment: .trailing)
				.foregroundColor(Color.green)
		}
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
		CountryDataRowView(country: .init())
    }
}
