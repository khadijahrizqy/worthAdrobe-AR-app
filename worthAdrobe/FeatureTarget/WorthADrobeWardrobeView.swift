//
//  WorthADrobeWardrobeView.swift
//  worthAdrobe
//
//  Created by Khadijah Rizqy on 25/05/23.
//

import SwiftUI

struct WorthADrobeWardrobeView: View {
    
    var body: some View {
        VStack {
            Text("                                                      ")
            HStack {
                Spacer()
                NavigationLink(destination: WorthADrobeItemDetailView()){
                    VStack {
                        Image("Shirt")
                            .resizable()
                            .frame(width: 95, height: 152)
                        Text("Shirt")
                    }
                }
                Spacer()
                VStack {
                    Text("                                                      ")
                }
            }
            Spacer()
            HStack {
                VStack {
                    Text("                                                      ")
                }
                VStack {
                    Text("                                                      ")
                }
            }
            Spacer()
            HStack {
                VStack {
                    Text("                                                      ")
                }
                VStack {
                    Text("                                                      ")
                }
            }
        }
        .navigationTitle("Wardrobe")
    }
}

struct WorthADrobeWardrobeView_Previews: PreviewProvider {
    static var previews: some View {
        WorthADrobeWardrobeView()
    }
}
