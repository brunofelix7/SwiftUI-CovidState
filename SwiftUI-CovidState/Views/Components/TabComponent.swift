import SwiftUI

struct TabComponent : View {
	
	let imageName: String
	let text: String
	
	var body: some View {
		VStack {
			Image(systemName: imageName)
			Text(text)
		}
	}
	
}
