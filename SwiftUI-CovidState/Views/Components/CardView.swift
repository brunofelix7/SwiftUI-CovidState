import SwiftUI

struct CardView: View {
	
	var worldData: WorldData
	
	init(worldData: WorldData) {
		self.worldData = worldData
	}
	
    var body: some View {
		VStack {
			HStack {
				TotalDataCardView(
					number: formatNumber(number: worldData.confirmed) ?? "-",
					name: "Confirmed")
				TotalDataCardView(
					number: formatNumber(number: worldData.critical) ?? "-",
					name: "Critical",
					color: .yellow)
				TotalDataCardView(
					number: formatNumber(number: worldData.deaths) ?? "-",
					name: "Deaths",
					color: .red)
			}
			HStack {
				TotalDataCardView(
					number: String(format: "%.2f", worldData.fatalityRate),
					name: "Death %",
					color: .red)
				TotalDataCardView(
					number: formatNumber(number: worldData.recovered) ?? "-",
					name: "Recovered",
					color: .green)
				TotalDataCardView(
					number: String(format: "%.2f", worldData.recoveredRate),
					name: "Recovered %",
					color: .green)
			}
		}
		.frame(height: 170)
		.padding(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(worldData: .init())
    }
}
