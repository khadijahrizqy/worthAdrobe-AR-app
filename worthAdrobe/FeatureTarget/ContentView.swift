//
//  ContentView.swift
//  worthAdrobe
//
//  Created by Khadijah Rizqy on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    let savedScale = UserDefaults.standard.float(forKey: "scale")
    
    var body: some View {
        NavigationView{
            ZStack {
                if colorScheme == .dark {
                    Image("LandingPageDark")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Image("LandingPageLight")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
                NavigationLink(destination:WorthADrobeCamera()){
                    Image(systemName: "camera.on.rectangle.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                .offset(y:310)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
