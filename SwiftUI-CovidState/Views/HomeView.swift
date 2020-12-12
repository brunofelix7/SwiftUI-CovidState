import SwiftUI

struct HomeView: View {
	
    var body: some View {
		TabView {
			RecentView(viewModel: .init())
				.tabItem {
					TabContentView(imageName: "chart.bar", text: "Recent")
				}
				.tag(0)
			MapContainerView(viewModel: .init())
				.edgesIgnoringSafeArea(.vertical)
				.tabItem {
					TabContentView(imageName: "map", text: "Maps")
				}
				.tag(1)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView().colorScheme(.dark)
    }
}
