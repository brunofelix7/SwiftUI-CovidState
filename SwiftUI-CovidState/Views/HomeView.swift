import SwiftUI

struct HomeView: View {
	
    var body: some View {
		TabView {
			RecentView(viewModel: .init())
				.tabItem {
					TabComponent(imageName: "chart.bar", text: "Recent")
				}
				.tag(0)
			//	TODO: Criar outra tab para MapView
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView()
    }
}
